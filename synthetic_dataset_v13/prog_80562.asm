; DESCRIPTION: Creates a orange rectangular region at (125, 18) spanning 37 by 24 pixels.
; PLAN: r0=125(x), r1=18(y), r2=37(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 18
LDI r2, 37
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
