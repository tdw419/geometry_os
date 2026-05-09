; DESCRIPTION: Composite: Draws a blue line from (340, 201) to (492, 192) then Renders a red disk with center (461, 103) and radius 28.
; PLAN: r0=340(x1), r1=201(y1), r2=492(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=461(x), r6=103(y), r7=28(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 340
LDI r1, 201
LDI r2, 492
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 103
LDI r7, 28
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
