; DESCRIPTION: Composite: Places a purple line segment connecting (134, 236) to (341, 163) then Renders a black box of size 50x100 starting at (240, 82).
; PLAN: r0=134(x1), r1=236(y1), r2=341(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=82(y), r7=50(width), r8=100(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 236
LDI r2, 341
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 82
LDI r7, 50
LDI r8, 100
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
