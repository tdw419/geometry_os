; DESCRIPTION: Places a blue 98x59 rectangle at position (270, 64).
; PLAN: r0=270(x), r1=64(y), r2=98(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 64
LDI r2, 98
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
