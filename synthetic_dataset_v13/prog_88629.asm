; DESCRIPTION: Creates a red rectangular region at (126, 106) spanning 114 by 44 pixels.
; PLAN: r0=126(x), r1=106(y), r2=114(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 106
LDI r2, 114
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
