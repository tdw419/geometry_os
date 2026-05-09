; DESCRIPTION: Composite: Sets a single magenta pixel at (145, 22) then Draws a white line from (432, 169) to (219, 86) then Places a cyan circle of radius 42 at center (385, 152).
; PLAN: r0=145(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=432(x1), r6=169(y1), r7=219(x2), r8=86(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=385(x), r11=152(y), r12=42(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 145
LDI r1, 22
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 432
LDI r6, 169
LDI r7, 219
LDI r8, 86
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 152
LDI r12, 42
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
