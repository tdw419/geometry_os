; DESCRIPTION: Composite: Creates a blue circular shape at (58, 137) with radius 51 then Creates a orange rectangular region at (25, 152) spanning 31 by 21 pixels then Sets a single cyan pixel at (426, 210).
; PLAN: r0=58(x), r1=137(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x), r6=152(y), r7=31(width), r8=21(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=426(x), r11=210(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 58
LDI r1, 137
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 152
LDI r7, 31
LDI r8, 21
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 210
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
