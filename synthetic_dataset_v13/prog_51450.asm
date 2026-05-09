; DESCRIPTION: Creates a blue rectangular region at (113, 106) spanning 110 by 57 pixels.
; PLAN: r0=113(x), r1=106(y), r2=110(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 106
LDI r2, 110
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
