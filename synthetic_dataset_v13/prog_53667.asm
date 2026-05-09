; DESCRIPTION: Composite: Places a white dot at position (457, 91) then Renders a green line between points (399, 255) and (509, 241) then Creates a magenta circular shape at (27, 123) with radius 18.
; PLAN: r0=457(x), r1=91(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=399(x1), r6=255(y1), r7=509(x2), r8=241(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=27(x), r11=123(y), r12=18(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 457
LDI r1, 91
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 399
LDI r6, 255
LDI r7, 509
LDI r8, 241
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 27
LDI r11, 123
LDI r12, 18
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
