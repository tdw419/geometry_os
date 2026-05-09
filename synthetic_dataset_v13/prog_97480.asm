; DESCRIPTION: Composite: Creates a magenta rectangular region at (245, 62) spanning 84 by 29 pixels then Places a yellow dot at position (368, 162).
; PLAN: r0=245(x), r1=62(y), r2=84(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=162(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 245
LDI r1, 62
LDI r2, 84
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 162
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
