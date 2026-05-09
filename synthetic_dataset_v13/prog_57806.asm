; DESCRIPTION: Creates a red rectangular region at (331, 6) spanning 64 by 14 pixels.
; PLAN: r0=331(x), r1=6(y), r2=64(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 6
LDI r2, 64
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
