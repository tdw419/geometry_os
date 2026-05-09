; DESCRIPTION: Creates a yellow rectangular region at (81, 226) spanning 105 by 13 pixels.
; PLAN: r0=81(x), r1=226(y), r2=105(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 226
LDI r2, 105
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
