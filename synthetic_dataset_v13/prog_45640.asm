; DESCRIPTION: Creates a orange rectangular region at (370, 133) spanning 119 by 54 pixels.
; PLAN: r0=370(x), r1=133(y), r2=119(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 133
LDI r2, 119
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
