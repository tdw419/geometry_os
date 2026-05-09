; DESCRIPTION: Places a blue 114x35 rectangle at position (331, 27).
; PLAN: r0=331(x), r1=27(y), r2=114(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 27
LDI r2, 114
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
