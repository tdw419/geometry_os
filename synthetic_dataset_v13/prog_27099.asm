; DESCRIPTION: Creates a red rectangular region at (25, 19) spanning 114 by 63 pixels.
; PLAN: r0=25(x), r1=19(y), r2=114(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 19
LDI r2, 114
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
