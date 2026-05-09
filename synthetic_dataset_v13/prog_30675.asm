; DESCRIPTION: Creates a black rectangular region at (122, 213) spanning 87 by 33 pixels.
; PLAN: r0=122(x), r1=213(y), r2=87(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 213
LDI r2, 87
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
