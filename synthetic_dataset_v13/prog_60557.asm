; DESCRIPTION: Creates a orange rectangular region at (244, 51) spanning 20 by 98 pixels.
; PLAN: r0=244(x), r1=51(y), r2=20(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 51
LDI r2, 20
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
