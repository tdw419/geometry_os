; DESCRIPTION: Creates a orange rectangular region at (155, 44) spanning 36 by 16 pixels.
; PLAN: r0=155(x), r1=44(y), r2=36(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 44
LDI r2, 36
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
