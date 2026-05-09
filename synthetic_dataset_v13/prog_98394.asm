; DESCRIPTION: Places a white 77x78 rectangle at position (86, 52).
; PLAN: r0=86(x), r1=52(y), r2=77(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 52
LDI r2, 77
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
