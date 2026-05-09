; DESCRIPTION: Creates a orange rectangular region at (377, 8) spanning 46 by 68 pixels.
; PLAN: r0=377(x), r1=8(y), r2=46(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 8
LDI r2, 46
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
