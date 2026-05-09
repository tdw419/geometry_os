; DESCRIPTION: Creates a black rectangular region at (57, 113) spanning 80 by 83 pixels.
; PLAN: r0=57(x), r1=113(y), r2=80(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 113
LDI r2, 80
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
