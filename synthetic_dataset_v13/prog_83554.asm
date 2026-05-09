; DESCRIPTION: Creates a orange rectangular region at (205, 205) spanning 40 by 37 pixels.
; PLAN: r0=205(x), r1=205(y), r2=40(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 205
LDI r2, 40
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
