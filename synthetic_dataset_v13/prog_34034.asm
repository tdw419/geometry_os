; DESCRIPTION: Creates a orange rectangular region at (288, 113) spanning 10 by 78 pixels.
; PLAN: r0=288(x), r1=113(y), r2=10(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 113
LDI r2, 10
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
