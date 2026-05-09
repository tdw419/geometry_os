; DESCRIPTION: Places a cyan 117x59 rectangle at position (158, 81).
; PLAN: r0=158(x), r1=81(y), r2=117(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 81
LDI r2, 117
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
