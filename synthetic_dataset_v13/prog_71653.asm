; DESCRIPTION: Places a white 119x36 rectangle at position (43, 219).
; PLAN: r0=43(x), r1=219(y), r2=119(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 219
LDI r2, 119
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
