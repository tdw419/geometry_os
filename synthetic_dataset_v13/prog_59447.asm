; DESCRIPTION: Creates a orange rectangular region at (417, 6) spanning 18 by 91 pixels.
; PLAN: r0=417(x), r1=6(y), r2=18(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 6
LDI r2, 18
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
