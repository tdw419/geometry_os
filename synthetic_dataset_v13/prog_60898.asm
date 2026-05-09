; DESCRIPTION: Places a yellow 15x72 rectangle at position (158, 162).
; PLAN: r0=158(x), r1=162(y), r2=15(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 162
LDI r2, 15
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
