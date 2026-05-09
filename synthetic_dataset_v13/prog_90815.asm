; DESCRIPTION: Creates a orange rectangular region at (464, 162) spanning 45 by 84 pixels.
; PLAN: r0=464(x), r1=162(y), r2=45(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 162
LDI r2, 45
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
