; DESCRIPTION: Creates a orange rectangular region at (359, 146) spanning 65 by 29 pixels.
; PLAN: r0=359(x), r1=146(y), r2=65(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 146
LDI r2, 65
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
