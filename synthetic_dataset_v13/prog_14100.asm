; DESCRIPTION: Creates a blue rectangular region at (38, 21) spanning 44 by 13 pixels.
; PLAN: r0=38(x), r1=21(y), r2=44(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 21
LDI r2, 44
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
