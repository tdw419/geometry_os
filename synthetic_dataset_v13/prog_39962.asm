; DESCRIPTION: Composite: Renders a white line between points (192, 168) and (449, 175) then Creates a blue circular shape at (300, 86) with radius 53 then Sets a single magenta pixel at (20, 249).
; PLAN: r0=192(x1), r1=168(y1), r2=449(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=86(y), r7=53(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=20(x), r11=249(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 192
LDI r1, 168
LDI r2, 449
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 86
LDI r7, 53
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 20
LDI r11, 249
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
