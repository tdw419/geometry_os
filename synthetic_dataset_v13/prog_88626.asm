; DESCRIPTION: Creates a black rectangular region at (216, 103) spanning 77 by 114 pixels.
; PLAN: r0=216(x), r1=103(y), r2=77(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 103
LDI r2, 77
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
