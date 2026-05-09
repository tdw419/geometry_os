; DESCRIPTION: Places a green 88x33 rectangle at position (407, 122).
; PLAN: r0=407(x), r1=122(y), r2=88(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 122
LDI r2, 88
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
