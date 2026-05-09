; DESCRIPTION: Creates a green rectangular region at (18, 31) spanning 96 by 67 pixels.
; PLAN: r0=18(x), r1=31(y), r2=96(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 31
LDI r2, 96
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
