; DESCRIPTION: Creates a blue rectangular region at (365, 17) spanning 13 by 38 pixels.
; PLAN: r0=365(x), r1=17(y), r2=13(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 17
LDI r2, 13
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
