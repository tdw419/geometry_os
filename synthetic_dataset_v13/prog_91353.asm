; DESCRIPTION: Places a white 43x23 rectangle at position (98, 136).
; PLAN: r0=98(x), r1=136(y), r2=43(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 136
LDI r2, 43
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
