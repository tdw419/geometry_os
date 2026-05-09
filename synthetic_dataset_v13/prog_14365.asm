; DESCRIPTION: Places a blue 16x11 rectangle at position (54, 168).
; PLAN: r0=54(x), r1=168(y), r2=16(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 168
LDI r2, 16
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
