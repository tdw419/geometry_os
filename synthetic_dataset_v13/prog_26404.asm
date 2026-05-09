; DESCRIPTION: Places a green 85x35 rectangle at position (8, 114).
; PLAN: r0=8(x), r1=114(y), r2=85(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 114
LDI r2, 85
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
