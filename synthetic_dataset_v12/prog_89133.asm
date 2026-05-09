; DESCRIPTION: Creates a orange rectangular region at (205, 27) spanning 81 by 46 pixels.
; PLAN: r0=205(x), r1=27(y), r2=81(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 27
LDI r2, 81
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
