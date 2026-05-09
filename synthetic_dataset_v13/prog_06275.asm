; DESCRIPTION: Creates a orange rectangular region at (464, 5) spanning 28 by 10 pixels.
; PLAN: r0=464(x), r1=5(y), r2=28(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 5
LDI r2, 28
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
