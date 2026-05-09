; DESCRIPTION: Places a blue 54x11 rectangle at position (108, 131).
; PLAN: r0=108(x), r1=131(y), r2=54(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 131
LDI r2, 54
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
