; DESCRIPTION: Places a red 52x112 rectangle at position (252, 20).
; PLAN: r0=252(x), r1=20(y), r2=52(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 20
LDI r2, 52
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
