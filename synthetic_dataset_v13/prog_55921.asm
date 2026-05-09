; DESCRIPTION: Composite: Places a orange dot at position (2, 70) then Creates a cyan rectangular region at (280, 0) spanning 114 by 51 pixels then Renders a purple disk with center (75, 159) and radius 43.
; PLAN: r0=2(x), r1=70(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=0(y), r7=114(width), r8=51(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=75(x), r11=159(y), r12=43(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 2
LDI r1, 70
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 280
LDI r6, 0
LDI r7, 114
LDI r8, 51
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 159
LDI r12, 43
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
