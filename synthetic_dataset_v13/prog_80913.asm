; DESCRIPTION: Creates a blue rectangular region at (184, 118) spanning 38 by 80 pixels.
; PLAN: r0=184(x), r1=118(y), r2=38(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 118
LDI r2, 38
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
