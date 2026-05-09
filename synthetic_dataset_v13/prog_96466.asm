; DESCRIPTION: Creates a red rectangular region at (114, 97) spanning 97 by 27 pixels.
; PLAN: r0=114(x), r1=97(y), r2=97(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 97
LDI r2, 97
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
