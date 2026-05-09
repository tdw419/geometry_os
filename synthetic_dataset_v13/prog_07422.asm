; DESCRIPTION: Creates a red rectangular region at (11, 128) spanning 52 by 33 pixels.
; PLAN: r0=11(x), r1=128(y), r2=52(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 128
LDI r2, 52
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
