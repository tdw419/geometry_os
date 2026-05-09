; DESCRIPTION: Places a green 52x44 rectangle at position (232, 30).
; PLAN: r0=232(x), r1=30(y), r2=52(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 30
LDI r2, 52
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
