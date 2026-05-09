; DESCRIPTION: Composite: Places a white dot at position (286, 136) then Renders a yellow line between points (294, 194) and (5, 137) then Creates a blue rectangular region at (271, 24) spanning 117 by 48 pixels.
; PLAN: r0=286(x), r1=136(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=294(x1), r6=194(y1), r7=5(x2), r8=137(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=271(x), r11=24(y), r12=117(width), r13=48(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 286
LDI r1, 136
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 294
LDI r6, 194
LDI r7, 5
LDI r8, 137
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 24
LDI r12, 117
LDI r13, 48
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
