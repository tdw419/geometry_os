; DESCRIPTION: Creates a green rectangular region at (355, 113) spanning 27 by 72 pixels.
; PLAN: r0=355(x), r1=113(y), r2=27(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 113
LDI r2, 27
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
