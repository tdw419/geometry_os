; DESCRIPTION: Places a red 52x14 rectangle at position (60, 222).
; PLAN: r0=60(x), r1=222(y), r2=52(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 222
LDI r2, 52
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
