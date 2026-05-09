; DESCRIPTION: Composite: Renders a yellow line between points (392, 32) and (458, 48) then Places a purple circle of radius 74 at center (288, 175).
; PLAN: r0=392(x1), r1=32(y1), r2=458(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=175(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 392
LDI r1, 32
LDI r2, 458
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 175
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
