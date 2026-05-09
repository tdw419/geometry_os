; DESCRIPTION: Creates a orange rectangular region at (170, 128) spanning 77 by 65 pixels.
; PLAN: r0=170(x), r1=128(y), r2=77(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 128
LDI r2, 77
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
