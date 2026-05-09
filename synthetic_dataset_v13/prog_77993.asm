; DESCRIPTION: Places a yellow 68x34 rectangle at position (6, 158).
; PLAN: r0=6(x), r1=158(y), r2=68(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 158
LDI r2, 68
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
