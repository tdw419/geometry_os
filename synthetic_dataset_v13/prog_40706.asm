; DESCRIPTION: Creates a orange rectangular region at (46, 29) spanning 83 by 40 pixels.
; PLAN: r0=46(x), r1=29(y), r2=83(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 29
LDI r2, 83
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
