; DESCRIPTION: Places a red 106x30 rectangle at position (101, 158).
; PLAN: r0=101(x), r1=158(y), r2=106(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 158
LDI r2, 106
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
