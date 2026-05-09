; DESCRIPTION: Creates a blue rectangular region at (220, 38) spanning 12 by 25 pixels.
; PLAN: r0=220(x), r1=38(y), r2=12(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 38
LDI r2, 12
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
