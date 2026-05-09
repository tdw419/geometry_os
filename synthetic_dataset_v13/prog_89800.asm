; DESCRIPTION: Places a white 26x88 rectangle at position (250, 33).
; PLAN: r0=250(x), r1=33(y), r2=26(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 33
LDI r2, 26
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
