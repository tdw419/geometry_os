; DESCRIPTION: Creates a white rectangular region at (18, 128) spanning 27 by 89 pixels.
; PLAN: r0=18(x), r1=128(y), r2=27(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 128
LDI r2, 27
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
