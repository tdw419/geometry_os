; DESCRIPTION: Places a blue 21x32 rectangle at position (54, 216).
; PLAN: r0=54(x), r1=216(y), r2=21(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 216
LDI r2, 21
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
