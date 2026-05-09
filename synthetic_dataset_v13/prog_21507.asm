; DESCRIPTION: Creates a black rectangular region at (27, 113) spanning 30 by 58 pixels.
; PLAN: r0=27(x), r1=113(y), r2=30(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 113
LDI r2, 30
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
