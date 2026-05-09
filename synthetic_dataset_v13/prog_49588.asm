; DESCRIPTION: Creates a orange rectangular region at (292, 144) spanning 89 by 81 pixels.
; PLAN: r0=292(x), r1=144(y), r2=89(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 144
LDI r2, 89
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
