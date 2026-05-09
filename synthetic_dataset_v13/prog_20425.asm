; DESCRIPTION: Places a green 23x52 rectangle at position (421, 20).
; PLAN: r0=421(x), r1=20(y), r2=23(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 20
LDI r2, 23
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
