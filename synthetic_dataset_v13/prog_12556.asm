; DESCRIPTION: Composite: Places a black dot at position (421, 127) then Renders a yellow line between points (80, 125) and (206, 54) then Draws a magenta circle centered at (298, 203) with radius 27.
; PLAN: r0=421(x), r1=127(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=80(x1), r6=125(y1), r7=206(x2), r8=54(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=298(x), r11=203(y), r12=27(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 421
LDI r1, 127
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 80
LDI r6, 125
LDI r7, 206
LDI r8, 54
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 298
LDI r11, 203
LDI r12, 27
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
