; DESCRIPTION: Places a blue 99x61 rectangle at position (254, 130).
; PLAN: r0=254(x), r1=130(y), r2=99(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 130
LDI r2, 99
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
