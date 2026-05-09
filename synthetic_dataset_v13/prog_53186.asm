; DESCRIPTION: Creates a white rectangular region at (448, 28) spanning 63 by 19 pixels.
; PLAN: r0=448(x), r1=28(y), r2=63(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 28
LDI r2, 63
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
