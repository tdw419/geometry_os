; DESCRIPTION: Composite: Sets a single orange pixel at (291, 34) then Renders a black line between points (440, 227) and (81, 2) then Places a magenta circle of radius 27 at center (196, 46).
; PLAN: r0=291(x), r1=34(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=440(x1), r6=227(y1), r7=81(x2), r8=2(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=196(x), r11=46(y), r12=27(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 291
LDI r1, 34
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 440
LDI r6, 227
LDI r7, 81
LDI r8, 2
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 46
LDI r12, 27
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
