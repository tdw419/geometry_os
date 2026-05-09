; DESCRIPTION: Creates a green rectangular region at (133, 113) spanning 86 by 65 pixels.
; PLAN: r0=133(x), r1=113(y), r2=86(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 113
LDI r2, 86
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
