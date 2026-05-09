; DESCRIPTION: Creates a blue rectangular region at (48, 115) spanning 68 by 110 pixels.
; PLAN: r0=48(x), r1=115(y), r2=68(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 115
LDI r2, 68
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
