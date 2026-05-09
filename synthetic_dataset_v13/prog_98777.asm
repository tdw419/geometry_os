; DESCRIPTION: Creates a yellow rectangular region at (358, 113) spanning 58 by 35 pixels.
; PLAN: r0=358(x), r1=113(y), r2=58(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 113
LDI r2, 58
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
