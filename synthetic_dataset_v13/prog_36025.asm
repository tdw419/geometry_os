; DESCRIPTION: Composite: Draws a white line from (339, 94) to (262, 88) then Sets a single magenta pixel at (31, 13) then Draws a cyan circle centered at (180, 80) with radius 74.
; PLAN: r0=339(x1), r1=94(y1), r2=262(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=31(x), r6=13(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=180(x), r11=80(y), r12=74(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 339
LDI r1, 94
LDI r2, 262
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 13
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 180
LDI r11, 80
LDI r12, 74
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
