; DESCRIPTION: Creates a white rectangular region at (121, 89) spanning 63 by 52 pixels.
; PLAN: r0=121(x), r1=89(y), r2=63(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 89
LDI r2, 63
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
