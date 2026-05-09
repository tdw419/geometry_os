; DESCRIPTION: Composite: Creates a cyan rectangular region at (106, 9) spanning 25 by 23 pixels then Places a orange dot at position (114, 112) then Renders a cyan disk with center (229, 186) and radius 48.
; PLAN: r0=106(x), r1=9(y), r2=25(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x), r6=112(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=229(x), r11=186(y), r12=48(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 106
LDI r1, 9
LDI r2, 25
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 112
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 229
LDI r11, 186
LDI r12, 48
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
