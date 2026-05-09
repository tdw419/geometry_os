; DESCRIPTION: Places a green 117x118 rectangle at position (240, 7).
; PLAN: r0=240(x), r1=7(y), r2=117(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 7
LDI r2, 117
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
