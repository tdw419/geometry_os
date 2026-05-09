; DESCRIPTION: Creates a red rectangular region at (287, 49) spanning 97 by 70 pixels.
; PLAN: r0=287(x), r1=49(y), r2=97(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 49
LDI r2, 97
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
