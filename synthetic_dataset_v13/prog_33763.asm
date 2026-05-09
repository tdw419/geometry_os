; DESCRIPTION: Creates a orange rectangular region at (287, 102) spanning 24 by 54 pixels.
; PLAN: r0=287(x), r1=102(y), r2=24(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 102
LDI r2, 24
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
