; DESCRIPTION: Creates a blue rectangular region at (455, 20) spanning 30 by 83 pixels.
; PLAN: r0=455(x), r1=20(y), r2=30(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 20
LDI r2, 30
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
