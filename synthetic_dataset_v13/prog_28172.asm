; DESCRIPTION: Creates a orange rectangular region at (208, 48) spanning 99 by 97 pixels.
; PLAN: r0=208(x), r1=48(y), r2=99(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 48
LDI r2, 99
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
