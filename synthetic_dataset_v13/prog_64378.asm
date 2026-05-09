; DESCRIPTION: Places a white 52x25 rectangle at position (15, 24).
; PLAN: r0=15(x), r1=24(y), r2=52(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 24
LDI r2, 52
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
