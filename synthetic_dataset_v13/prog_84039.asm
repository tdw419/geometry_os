; DESCRIPTION: Composite: Places a cyan dot at position (345, 196) then Renders a green line between points (204, 205) and (466, 116) then Creates a green circular shape at (254, 105) with radius 68.
; PLAN: r0=345(x), r1=196(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=204(x1), r6=205(y1), r7=466(x2), r8=116(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=254(x), r11=105(y), r12=68(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 345
LDI r1, 196
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 204
LDI r6, 205
LDI r7, 466
LDI r8, 116
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 254
LDI r11, 105
LDI r12, 68
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
