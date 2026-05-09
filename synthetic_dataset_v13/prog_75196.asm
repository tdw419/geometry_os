; DESCRIPTION: Creates a orange rectangular region at (74, 43) spanning 93 by 65 pixels.
; PLAN: r0=74(x), r1=43(y), r2=93(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 43
LDI r2, 93
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
