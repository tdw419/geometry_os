; DESCRIPTION: Composite: Places a black dot at position (74, 76) then Renders a green line between points (123, 206) and (211, 101) then Renders a magenta disk with center (283, 149) and radius 64.
; PLAN: r0=74(x), r1=76(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=123(x1), r6=206(y1), r7=211(x2), r8=101(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=283(x), r11=149(y), r12=64(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 74
LDI r1, 76
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 123
LDI r6, 206
LDI r7, 211
LDI r8, 101
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 283
LDI r11, 149
LDI r12, 64
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
