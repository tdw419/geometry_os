; DESCRIPTION: Creates a orange rectangular region at (24, 26) spanning 32 by 117 pixels.
; PLAN: r0=24(x), r1=26(y), r2=32(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 26
LDI r2, 32
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
