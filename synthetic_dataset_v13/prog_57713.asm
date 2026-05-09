; DESCRIPTION: Creates a orange rectangular region at (417, 14) spanning 39 by 56 pixels.
; PLAN: r0=417(x), r1=14(y), r2=39(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 14
LDI r2, 39
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
