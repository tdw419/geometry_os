; DESCRIPTION: Composite: Places a magenta dot at position (105, 201) then Creates a green rectangular region at (421, 48) spanning 81 by 40 pixels then Renders a magenta line between points (425, 251) and (312, 223).
; PLAN: r0=105(x), r1=201(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=421(x), r6=48(y), r7=81(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=425(x1), r11=251(y1), r12=312(x2), r13=223(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 201
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 421
LDI r6, 48
LDI r7, 81
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 251
LDI r12, 312
LDI r13, 223
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
