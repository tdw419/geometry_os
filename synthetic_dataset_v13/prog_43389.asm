; DESCRIPTION: Composite: Places a blue line segment connecting (353, 133) to (68, 105) then Places a orange circle of radius 11 at center (215, 150).
; PLAN: r0=353(x1), r1=133(y1), r2=68(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=150(y), r7=11(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 353
LDI r1, 133
LDI r2, 68
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 150
LDI r7, 11
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
