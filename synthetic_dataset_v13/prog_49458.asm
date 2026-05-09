; DESCRIPTION: Places a blue 90x83 rectangle at position (109, 52).
; PLAN: r0=109(x), r1=52(y), r2=90(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 52
LDI r2, 90
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
