; DESCRIPTION: Places a white 52x110 rectangle at position (183, 97).
; PLAN: r0=183(x), r1=97(y), r2=52(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 97
LDI r2, 52
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
