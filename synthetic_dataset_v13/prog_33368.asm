; DESCRIPTION: Creates a black rectangular region at (184, 180) spanning 51 by 66 pixels.
; PLAN: r0=184(x), r1=180(y), r2=51(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 180
LDI r2, 51
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
