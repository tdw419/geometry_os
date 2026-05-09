; DESCRIPTION: Creates a white rectangular region at (402, 205) spanning 51 by 28 pixels.
; PLAN: r0=402(x), r1=205(y), r2=51(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 205
LDI r2, 51
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
