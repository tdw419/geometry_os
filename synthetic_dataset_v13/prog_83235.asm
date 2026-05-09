; DESCRIPTION: Creates a yellow rectangular region at (64, 66) spanning 114 by 93 pixels.
; PLAN: r0=64(x), r1=66(y), r2=114(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 66
LDI r2, 114
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
