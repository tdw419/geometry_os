; DESCRIPTION: Composite: Places a green dot at position (85, 41) then Renders a yellow line between points (160, 61) and (457, 254) then Draws a magenta circle centered at (243, 89) with radius 64.
; PLAN: r0=85(x), r1=41(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=160(x1), r6=61(y1), r7=457(x2), r8=254(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=243(x), r11=89(y), r12=64(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 85
LDI r1, 41
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 160
LDI r6, 61
LDI r7, 457
LDI r8, 254
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 89
LDI r12, 64
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
