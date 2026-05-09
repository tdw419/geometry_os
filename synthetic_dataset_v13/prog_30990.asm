; DESCRIPTION: Places a blue 99x63 rectangle at position (388, 18).
; PLAN: r0=388(x), r1=18(y), r2=99(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 18
LDI r2, 99
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
