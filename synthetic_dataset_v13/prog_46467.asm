; DESCRIPTION: Places a red 16x47 rectangle at position (101, 97).
; PLAN: r0=101(x), r1=97(y), r2=16(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 97
LDI r2, 16
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
