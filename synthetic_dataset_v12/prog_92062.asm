; DESCRIPTION: Creates a magenta rectangular region at (198, 49) spanning 98 by 110 pixels.
; PLAN: r0=198(x), r1=49(y), r2=98(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 49
LDI r2, 98
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
