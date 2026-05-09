; DESCRIPTION: Creates a orange rectangular region at (125, 76) spanning 17 by 50 pixels.
; PLAN: r0=125(x), r1=76(y), r2=17(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 76
LDI r2, 17
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
