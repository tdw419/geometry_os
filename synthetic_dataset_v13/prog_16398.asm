; DESCRIPTION: Creates a red rectangular region at (9, 114) spanning 26 by 14 pixels.
; PLAN: r0=9(x), r1=114(y), r2=26(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 114
LDI r2, 26
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
