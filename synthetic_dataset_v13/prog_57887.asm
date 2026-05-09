; DESCRIPTION: Creates a orange rectangular region at (419, 157) spanning 88 by 39 pixels.
; PLAN: r0=419(x), r1=157(y), r2=88(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 157
LDI r2, 88
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
