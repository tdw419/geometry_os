; DESCRIPTION: Places a green 80x17 rectangle at position (86, 74).
; PLAN: r0=86(x), r1=74(y), r2=80(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 74
LDI r2, 80
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
