; DESCRIPTION: Composite: Places a purple line segment connecting (79, 66) to (85, 133) then Places a blue circle of radius 37 at center (60, 107).
; PLAN: r0=79(x1), r1=66(y1), r2=85(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=107(y), r7=37(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 79
LDI r1, 66
LDI r2, 85
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 107
LDI r7, 37
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
