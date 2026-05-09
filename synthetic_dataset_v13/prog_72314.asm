; DESCRIPTION: Composite: Places a cyan line segment connecting (122, 91) to (2, 11) then Places a yellow dot at position (335, 24) then Renders a purple box of size 44x111 starting at (148, 133).
; PLAN: r0=122(x1), r1=91(y1), r2=2(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=24(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=148(x), r11=133(y), r12=44(width), r13=111(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 91
LDI r2, 2
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 24
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 148
LDI r11, 133
LDI r12, 44
LDI r13, 111
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
