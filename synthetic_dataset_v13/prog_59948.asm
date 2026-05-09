; DESCRIPTION: Creates a yellow rectangular region at (343, 166) spanning 90 by 63 pixels.
; PLAN: r0=343(x), r1=166(y), r2=90(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 166
LDI r2, 90
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
