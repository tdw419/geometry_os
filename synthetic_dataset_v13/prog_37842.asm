; DESCRIPTION: Creates a orange rectangular region at (36, 172) spanning 96 by 74 pixels.
; PLAN: r0=36(x), r1=172(y), r2=96(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 172
LDI r2, 96
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
