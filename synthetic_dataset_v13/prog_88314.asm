; DESCRIPTION: Creates a black rectangular region at (267, 84) spanning 77 by 98 pixels.
; PLAN: r0=267(x), r1=84(y), r2=77(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 84
LDI r2, 77
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
