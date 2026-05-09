; DESCRIPTION: Composite: Sets a single black pixel at (504, 12) then Creates a blue circular shape at (291, 65) with radius 65 then Draws a yellow line from (393, 21) to (1, 158).
; PLAN: r0=504(x), r1=12(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=65(y), r7=65(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=393(x1), r11=21(y1), r12=1(x2), r13=158(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 504
LDI r1, 12
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 291
LDI r6, 65
LDI r7, 65
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 393
LDI r11, 21
LDI r12, 1
LDI r13, 158
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
