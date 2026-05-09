; DESCRIPTION: Creates a orange rectangular region at (370, 70) spanning 92 by 43 pixels.
; PLAN: r0=370(x), r1=70(y), r2=92(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 70
LDI r2, 92
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
