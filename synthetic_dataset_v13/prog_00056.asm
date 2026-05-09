; DESCRIPTION: Composite: Places a yellow dot at position (123, 137) then Renders a magenta box of size 31x26 starting at (85, 29) then Creates a red circular shape at (272, 101) with radius 48.
; PLAN: r0=123(x), r1=137(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=85(x), r6=29(y), r7=31(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=272(x), r11=101(y), r12=48(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 123
LDI r1, 137
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 85
LDI r6, 29
LDI r7, 31
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 101
LDI r12, 48
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
