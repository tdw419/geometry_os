; DESCRIPTION: Places a red 81x75 rectangle at position (69, 137).
; PLAN: r0=69(x), r1=137(y), r2=81(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 137
LDI r2, 81
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
