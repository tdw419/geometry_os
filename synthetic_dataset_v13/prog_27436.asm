; DESCRIPTION: Creates a orange rectangular region at (331, 160) spanning 78 by 48 pixels.
; PLAN: r0=331(x), r1=160(y), r2=78(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 160
LDI r2, 78
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
