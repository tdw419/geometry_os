; DESCRIPTION: Creates a orange rectangular region at (0, 65) spanning 98 by 81 pixels.
; PLAN: r0=0(x), r1=65(y), r2=98(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 65
LDI r2, 98
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
