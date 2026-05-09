; DESCRIPTION: Places a green 81x34 rectangle at position (2, 153).
; PLAN: r0=2(x), r1=153(y), r2=81(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 153
LDI r2, 81
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
