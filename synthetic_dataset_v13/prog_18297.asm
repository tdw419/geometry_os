; DESCRIPTION: Creates a orange rectangular region at (349, 52) spanning 15 by 112 pixels.
; PLAN: r0=349(x), r1=52(y), r2=15(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 52
LDI r2, 15
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
