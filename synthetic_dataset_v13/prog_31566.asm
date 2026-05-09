; DESCRIPTION: Places a white 49x75 rectangle at position (265, 4).
; PLAN: r0=265(x), r1=4(y), r2=49(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 4
LDI r2, 49
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
