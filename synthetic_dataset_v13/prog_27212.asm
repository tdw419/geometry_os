; DESCRIPTION: Places a white 103x89 rectangle at position (87, 88).
; PLAN: r0=87(x), r1=88(y), r2=103(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 88
LDI r2, 103
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
