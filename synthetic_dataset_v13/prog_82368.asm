; DESCRIPTION: Composite: Places a cyan dot at position (37, 0) then Renders a green box of size 41x87 starting at (145, 135) then Creates a magenta circular shape at (430, 91) with radius 41.
; PLAN: r0=37(x), r1=0(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=135(y), r7=41(width), r8=87(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=430(x), r11=91(y), r12=41(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 37
LDI r1, 0
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 145
LDI r6, 135
LDI r7, 41
LDI r8, 87
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 430
LDI r11, 91
LDI r12, 41
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
