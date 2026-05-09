; DESCRIPTION: Creates a black rectangular region at (151, 56) spanning 40 by 63 pixels.
; PLAN: r0=151(x), r1=56(y), r2=40(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 56
LDI r2, 40
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
