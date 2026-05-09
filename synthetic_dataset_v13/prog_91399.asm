; DESCRIPTION: Creates a green rectangular region at (81, 113) spanning 17 by 30 pixels.
; PLAN: r0=81(x), r1=113(y), r2=17(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 113
LDI r2, 17
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
