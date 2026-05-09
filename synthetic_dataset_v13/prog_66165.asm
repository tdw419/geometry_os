; DESCRIPTION: Composite: Places a cyan dot at position (136, 8) then Creates a green rectangular region at (110, 27) spanning 110 by 86 pixels then Draws a green circle centered at (263, 174) with radius 77.
; PLAN: r0=136(x), r1=8(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=110(x), r6=27(y), r7=110(width), r8=86(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=263(x), r11=174(y), r12=77(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 136
LDI r1, 8
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 110
LDI r6, 27
LDI r7, 110
LDI r8, 86
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 174
LDI r12, 77
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
