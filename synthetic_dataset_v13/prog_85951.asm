; DESCRIPTION: Composite: Places a blue dot at position (413, 16) then Renders a magenta line between points (253, 152) and (175, 219) then Creates a blue circular shape at (274, 140) with radius 78.
; PLAN: r0=413(x), r1=16(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=253(x1), r6=152(y1), r7=175(x2), r8=219(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=140(y), r12=78(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 413
LDI r1, 16
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 253
LDI r6, 152
LDI r7, 175
LDI r8, 219
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 140
LDI r12, 78
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
