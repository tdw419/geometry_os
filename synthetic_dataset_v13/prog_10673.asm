; DESCRIPTION: Creates a green rectangular region at (198, 86) spanning 56 by 12 pixels.
; PLAN: r0=198(x), r1=86(y), r2=56(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 86
LDI r2, 56
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
