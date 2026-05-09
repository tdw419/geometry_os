; DESCRIPTION: Creates a purple rectangular region at (66, 31) spanning 114 by 103 pixels.
; PLAN: r0=66(x), r1=31(y), r2=114(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 31
LDI r2, 114
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
