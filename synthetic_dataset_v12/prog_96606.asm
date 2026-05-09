; DESCRIPTION: Creates a yellow rectangular region at (413, 140) spanning 81 by 66 pixels.
; PLAN: r0=413(x), r1=140(y), r2=81(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 140
LDI r2, 81
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
