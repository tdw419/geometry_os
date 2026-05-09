; DESCRIPTION: Places a red 110x52 rectangle at position (76, 7).
; PLAN: r0=76(x), r1=7(y), r2=110(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 7
LDI r2, 110
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
