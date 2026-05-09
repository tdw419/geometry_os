; DESCRIPTION: Places a white 88x25 rectangle at position (420, 181).
; PLAN: r0=420(x), r1=181(y), r2=88(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 181
LDI r2, 88
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
