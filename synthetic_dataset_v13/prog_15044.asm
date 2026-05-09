; DESCRIPTION: Creates a orange rectangular region at (70, 60) spanning 46 by 100 pixels.
; PLAN: r0=70(x), r1=60(y), r2=46(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 60
LDI r2, 46
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
