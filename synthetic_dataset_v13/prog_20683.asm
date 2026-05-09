; DESCRIPTION: Creates a yellow rectangular region at (64, 123) spanning 16 by 27 pixels.
; PLAN: r0=64(x), r1=123(y), r2=16(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 123
LDI r2, 16
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
