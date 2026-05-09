; DESCRIPTION: Places a red 52x103 rectangle at position (338, 139).
; PLAN: r0=338(x), r1=139(y), r2=52(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 139
LDI r2, 52
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
