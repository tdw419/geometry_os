; DESCRIPTION: Creates a yellow rectangular region at (334, 32) spanning 74 by 30 pixels.
; PLAN: r0=334(x), r1=32(y), r2=74(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 32
LDI r2, 74
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
