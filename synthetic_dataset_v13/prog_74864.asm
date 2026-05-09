; DESCRIPTION: Creates a orange rectangular region at (366, 181) spanning 79 by 53 pixels.
; PLAN: r0=366(x), r1=181(y), r2=79(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 181
LDI r2, 79
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
