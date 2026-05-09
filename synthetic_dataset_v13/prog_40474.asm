; DESCRIPTION: Creates a black rectangular region at (359, 150) spanning 43 by 91 pixels.
; PLAN: r0=359(x), r1=150(y), r2=43(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 150
LDI r2, 43
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
