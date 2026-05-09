; DESCRIPTION: Creates a yellow rectangular region at (138, 175) spanning 81 by 48 pixels.
; PLAN: r0=138(x), r1=175(y), r2=81(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 175
LDI r2, 81
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
