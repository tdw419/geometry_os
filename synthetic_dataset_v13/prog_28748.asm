; DESCRIPTION: Creates a white rectangular region at (63, 81) spanning 48 by 52 pixels.
; PLAN: r0=63(x), r1=81(y), r2=48(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 81
LDI r2, 48
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
