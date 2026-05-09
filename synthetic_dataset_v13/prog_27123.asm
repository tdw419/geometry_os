; DESCRIPTION: Places a white 115x25 rectangle at position (227, 5).
; PLAN: r0=227(x), r1=5(y), r2=115(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 5
LDI r2, 115
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
