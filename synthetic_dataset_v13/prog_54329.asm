; DESCRIPTION: Creates a black rectangular region at (249, 21) spanning 77 by 84 pixels.
; PLAN: r0=249(x), r1=21(y), r2=77(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 21
LDI r2, 77
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
