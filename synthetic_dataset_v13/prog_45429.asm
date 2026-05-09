; DESCRIPTION: Creates a orange rectangular region at (8, 65) spanning 32 by 89 pixels.
; PLAN: r0=8(x), r1=65(y), r2=32(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 65
LDI r2, 32
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
