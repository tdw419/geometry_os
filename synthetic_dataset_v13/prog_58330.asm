; DESCRIPTION: Creates a orange rectangular region at (419, 86) spanning 25 by 84 pixels.
; PLAN: r0=419(x), r1=86(y), r2=25(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 86
LDI r2, 25
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
