; DESCRIPTION: Places a green 81x110 rectangle at position (101, 113).
; PLAN: r0=101(x), r1=113(y), r2=81(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 113
LDI r2, 81
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
