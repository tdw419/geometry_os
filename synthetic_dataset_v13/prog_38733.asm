; DESCRIPTION: Places a yellow 81x35 rectangle at position (412, 162).
; PLAN: r0=412(x), r1=162(y), r2=81(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 162
LDI r2, 81
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
