; DESCRIPTION: Places a red 54x106 rectangle at position (259, 88).
; PLAN: r0=259(x), r1=88(y), r2=54(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 88
LDI r2, 54
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
