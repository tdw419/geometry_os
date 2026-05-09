; DESCRIPTION: Creates a magenta rectangular region at (287, 115) spanning 54 by 99 pixels.
; PLAN: r0=287(x), r1=115(y), r2=54(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 115
LDI r2, 54
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
