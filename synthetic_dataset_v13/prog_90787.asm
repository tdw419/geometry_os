; DESCRIPTION: Places a red 68x110 rectangle at position (179, 9).
; PLAN: r0=179(x), r1=9(y), r2=68(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 9
LDI r2, 68
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
