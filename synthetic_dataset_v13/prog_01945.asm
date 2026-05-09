; DESCRIPTION: Creates a yellow rectangular region at (64, 139) spanning 96 by 66 pixels.
; PLAN: r0=64(x), r1=139(y), r2=96(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 139
LDI r2, 96
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
