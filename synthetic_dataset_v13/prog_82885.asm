; DESCRIPTION: Composite: Draws a orange circle centered at (210, 155) with radius 65 then Places a purple line segment connecting (8, 60) to (197, 35).
; PLAN: r0=210(x), r1=155(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x1), r6=60(y1), r7=197(x2), r8=35(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 210
LDI r1, 155
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 60
LDI r7, 197
LDI r8, 35
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
