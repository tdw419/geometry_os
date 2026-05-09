; DESCRIPTION: Places a blue 59x59 rectangle at position (158, 17).
; PLAN: r0=158(x), r1=17(y), r2=59(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 17
LDI r2, 59
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
