; DESCRIPTION: Creates a orange rectangular region at (377, 232) spanning 46 by 16 pixels.
; PLAN: r0=377(x), r1=232(y), r2=46(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 232
LDI r2, 46
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
