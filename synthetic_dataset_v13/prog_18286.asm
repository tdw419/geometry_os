; DESCRIPTION: Composite: Sets a single green pixel at (251, 154) then Creates a orange rectangular region at (70, 175) spanning 43 by 79 pixels then Creates a orange circular shape at (454, 196) with radius 44.
; PLAN: r0=251(x), r1=154(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=70(x), r6=175(y), r7=43(width), r8=79(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=454(x), r11=196(y), r12=44(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 251
LDI r1, 154
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 70
LDI r6, 175
LDI r7, 43
LDI r8, 79
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 196
LDI r12, 44
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
