; DESCRIPTION: Creates a orange rectangular region at (420, 17) spanning 56 by 11 pixels.
; PLAN: r0=420(x), r1=17(y), r2=56(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 17
LDI r2, 56
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
