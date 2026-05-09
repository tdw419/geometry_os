; DESCRIPTION: Places a red 52x110 rectangle at position (184, 52).
; PLAN: r0=184(x), r1=52(y), r2=52(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 52
LDI r2, 52
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
