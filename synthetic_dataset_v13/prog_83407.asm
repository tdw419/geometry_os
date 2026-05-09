; DESCRIPTION: Creates a blue rectangular region at (199, 49) spanning 18 by 21 pixels.
; PLAN: r0=199(x), r1=49(y), r2=18(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 49
LDI r2, 18
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
