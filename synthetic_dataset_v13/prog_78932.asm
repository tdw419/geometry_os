; DESCRIPTION: Composite: Renders a green disk with center (497, 112) and radius 11 then Creates a orange rectangular region at (27, 0) spanning 25 by 116 pixels then Places a magenta dot at position (365, 91).
; PLAN: r0=497(x), r1=112(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x), r6=0(y), r7=25(width), r8=116(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x), r11=91(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 497
LDI r1, 112
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 0
LDI r7, 25
LDI r8, 116
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 91
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
