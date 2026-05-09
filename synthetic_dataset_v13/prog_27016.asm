; DESCRIPTION: Creates a black rectangular region at (261, 63) spanning 112 by 90 pixels.
; PLAN: r0=261(x), r1=63(y), r2=112(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 63
LDI r2, 112
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
