; DESCRIPTION: Composite: Draws a magenta line from (253, 100) to (74, 81) then Renders a green disk with center (136, 101) and radius 78 then Places a magenta dot at position (66, 227).
; PLAN: r0=253(x1), r1=100(y1), r2=74(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=136(x), r6=101(y), r7=78(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=66(x), r11=227(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 253
LDI r1, 100
LDI r2, 74
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 101
LDI r7, 78
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 66
LDI r11, 227
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
