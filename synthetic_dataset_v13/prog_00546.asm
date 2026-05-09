; DESCRIPTION: Places a red 81x68 rectangle at position (268, 137).
; PLAN: r0=268(x), r1=137(y), r2=81(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 137
LDI r2, 81
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
