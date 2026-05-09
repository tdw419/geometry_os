; DESCRIPTION: Composite: Places a magenta dot at position (113, 76) then Renders a yellow line between points (387, 198) and (187, 101) then Draws a black circle centered at (82, 128) with radius 27.
; PLAN: r0=113(x), r1=76(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=387(x1), r6=198(y1), r7=187(x2), r8=101(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=82(x), r11=128(y), r12=27(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 113
LDI r1, 76
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 387
LDI r6, 198
LDI r7, 187
LDI r8, 101
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 128
LDI r12, 27
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
