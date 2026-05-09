; DESCRIPTION: Creates a white rectangular region at (132, 113) spanning 111 by 74 pixels.
; PLAN: r0=132(x), r1=113(y), r2=111(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 113
LDI r2, 111
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
