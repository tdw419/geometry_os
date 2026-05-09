; DESCRIPTION: Creates a yellow rectangular region at (289, 114) spanning 81 by 109 pixels.
; PLAN: r0=289(x), r1=114(y), r2=81(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 114
LDI r2, 81
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
