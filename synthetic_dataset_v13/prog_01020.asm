; DESCRIPTION: Creates a orange rectangular region at (356, 86) spanning 51 by 19 pixels.
; PLAN: r0=356(x), r1=86(y), r2=51(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 86
LDI r2, 51
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
