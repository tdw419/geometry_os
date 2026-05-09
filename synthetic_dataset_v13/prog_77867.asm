; DESCRIPTION: Creates a red rectangular region at (219, 13) spanning 18 by 81 pixels.
; PLAN: r0=219(x), r1=13(y), r2=18(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 13
LDI r2, 18
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
