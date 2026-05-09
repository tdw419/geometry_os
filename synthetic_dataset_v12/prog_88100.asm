; DESCRIPTION: Creates a blue rectangular region at (239, 45) spanning 80 by 110 pixels.
; PLAN: r0=239(x), r1=45(y), r2=80(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 45
LDI r2, 80
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
