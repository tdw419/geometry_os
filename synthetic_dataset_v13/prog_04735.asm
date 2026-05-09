; DESCRIPTION: Places a blue 58x80 rectangle at position (108, 54).
; PLAN: r0=108(x), r1=54(y), r2=58(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 54
LDI r2, 58
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
