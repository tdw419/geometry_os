; DESCRIPTION: Places a black 43x33 rectangle at position (310, 203).
; PLAN: r0=310(x), r1=203(y), r2=43(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 203
LDI r2, 43
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
