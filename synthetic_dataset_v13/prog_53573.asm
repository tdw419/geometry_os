; DESCRIPTION: Places a white 87x113 rectangle at position (52, 110).
; PLAN: r0=52(x), r1=110(y), r2=87(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 110
LDI r2, 87
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
