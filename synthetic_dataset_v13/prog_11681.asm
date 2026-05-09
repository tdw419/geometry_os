; DESCRIPTION: Creates a orange rectangular region at (385, 98) spanning 26 by 73 pixels.
; PLAN: r0=385(x), r1=98(y), r2=26(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 98
LDI r2, 26
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
