; DESCRIPTION: Creates a black rectangular region at (280, 113) spanning 74 by 28 pixels.
; PLAN: r0=280(x), r1=113(y), r2=74(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 113
LDI r2, 74
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
