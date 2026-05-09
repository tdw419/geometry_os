; DESCRIPTION: Creates a yellow rectangular region at (6, 96) spanning 67 by 34 pixels.
; PLAN: r0=6(x), r1=96(y), r2=67(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 96
LDI r2, 67
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
