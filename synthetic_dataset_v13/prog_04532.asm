; DESCRIPTION: Creates a red rectangular region at (483, 137) spanning 27 by 66 pixels.
; PLAN: r0=483(x), r1=137(y), r2=27(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 137
LDI r2, 27
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
