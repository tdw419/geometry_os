; DESCRIPTION: Creates a orange rectangular region at (105, 98) spanning 76 by 93 pixels.
; PLAN: r0=105(x), r1=98(y), r2=76(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 98
LDI r2, 76
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
