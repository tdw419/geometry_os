; DESCRIPTION: Composite: Places a orange dot at position (505, 63) then Places a cyan circle of radius 22 at center (158, 140) then Renders a magenta line between points (131, 234) and (113, 7).
; PLAN: r0=505(x), r1=63(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=158(x), r6=140(y), r7=22(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=131(x1), r11=234(y1), r12=113(x2), r13=7(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 505
LDI r1, 63
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 158
LDI r6, 140
LDI r7, 22
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 131
LDI r11, 234
LDI r12, 113
LDI r13, 7
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
