; DESCRIPTION: Places a white 17x19 rectangle at position (402, 232).
; PLAN: r0=402(x), r1=232(y), r2=17(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 232
LDI r2, 17
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
