; DESCRIPTION: Composite: Sets a single green pixel at (52, 120) then Places a orange circle of radius 51 at center (243, 200) then Places a purple line segment connecting (79, 0) to (314, 32).
; PLAN: r0=52(x), r1=120(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=200(y), r7=51(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=79(x1), r11=0(y1), r12=314(x2), r13=32(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 120
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 243
LDI r6, 200
LDI r7, 51
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 79
LDI r11, 0
LDI r12, 314
LDI r13, 32
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
