; DESCRIPTION: Creates a orange rectangular region at (406, 95) spanning 89 by 35 pixels.
; PLAN: r0=406(x), r1=95(y), r2=89(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 95
LDI r2, 89
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
