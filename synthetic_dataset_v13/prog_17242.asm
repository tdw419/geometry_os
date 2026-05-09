; DESCRIPTION: Places a red 52x26 rectangle at position (9, 173).
; PLAN: r0=9(x), r1=173(y), r2=52(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 173
LDI r2, 52
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
