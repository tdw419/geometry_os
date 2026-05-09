; DESCRIPTION: Creates a red rectangular region at (287, 22) spanning 11 by 52 pixels.
; PLAN: r0=287(x), r1=22(y), r2=11(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 22
LDI r2, 11
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
