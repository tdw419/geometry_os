; DESCRIPTION: Creates a green rectangular region at (126, 113) spanning 40 by 56 pixels.
; PLAN: r0=126(x), r1=113(y), r2=40(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 113
LDI r2, 40
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
