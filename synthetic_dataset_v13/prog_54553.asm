; DESCRIPTION: Creates a orange rectangular region at (296, 49) spanning 112 by 25 pixels.
; PLAN: r0=296(x), r1=49(y), r2=112(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 49
LDI r2, 112
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
