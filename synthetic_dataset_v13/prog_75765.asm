; DESCRIPTION: Places a blue 36x110 rectangle at position (68, 71).
; PLAN: r0=68(x), r1=71(y), r2=36(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 71
LDI r2, 36
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
