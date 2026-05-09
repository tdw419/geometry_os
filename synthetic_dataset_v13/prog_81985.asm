; DESCRIPTION: Creates a orange rectangular region at (101, 134) spanning 65 by 47 pixels.
; PLAN: r0=101(x), r1=134(y), r2=65(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 134
LDI r2, 65
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
