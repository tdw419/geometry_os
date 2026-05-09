; DESCRIPTION: Creates a orange rectangular region at (454, 145) spanning 18 by 25 pixels.
; PLAN: r0=454(x), r1=145(y), r2=18(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 145
LDI r2, 18
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
