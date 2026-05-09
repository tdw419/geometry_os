; DESCRIPTION: Composite: Renders a black box of size 75x69 starting at (120, 149) then Places a green line segment connecting (489, 251) to (341, 133).
; PLAN: r0=120(x), r1=149(y), r2=75(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=489(x1), r6=251(y1), r7=341(x2), r8=133(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 149
LDI r2, 75
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 251
LDI r7, 341
LDI r8, 133
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
