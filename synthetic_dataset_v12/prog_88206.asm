; DESCRIPTION: Creates a orange rectangular region at (406, 89) spanning 46 by 32 pixels.
; PLAN: r0=406(x), r1=89(y), r2=46(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 89
LDI r2, 46
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
