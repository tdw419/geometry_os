; DESCRIPTION: Creates a orange rectangular region at (53, 68) spanning 79 by 80 pixels.
; PLAN: r0=53(x), r1=68(y), r2=79(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 68
LDI r2, 79
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
