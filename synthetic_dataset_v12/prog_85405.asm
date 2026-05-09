; DESCRIPTION: Composite: Places a orange dot at position (410, 178) then Renders a orange disk with center (106, 97) and radius 44 then Renders a magenta box of size 58x101 starting at (430, 87).
; PLAN: r0=410(x), r1=178(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=106(x), r6=97(y), r7=44(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x), r11=87(y), r12=58(width), r13=101(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 178
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 106
LDI r6, 97
LDI r7, 44
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 87
LDI r12, 58
LDI r13, 101
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
