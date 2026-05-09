; DESCRIPTION: Creates a blue rectangular region at (198, 56) spanning 71 by 99 pixels.
; PLAN: r0=198(x), r1=56(y), r2=71(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 56
LDI r2, 71
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
