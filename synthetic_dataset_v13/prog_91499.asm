; DESCRIPTION: Places a white 17x46 rectangle at position (310, 199).
; PLAN: r0=310(x), r1=199(y), r2=17(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 199
LDI r2, 17
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
