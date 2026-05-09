; DESCRIPTION: Creates a orange rectangular region at (249, 133) spanning 91 by 22 pixels.
; PLAN: r0=249(x), r1=133(y), r2=91(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 133
LDI r2, 91
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
