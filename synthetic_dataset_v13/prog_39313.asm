; DESCRIPTION: Creates a blue rectangular region at (320, 162) spanning 30 by 66 pixels.
; PLAN: r0=320(x), r1=162(y), r2=30(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 162
LDI r2, 30
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
