; DESCRIPTION: Places a magenta 94x20 rectangle at position (170, 155).
; PLAN: r0=170(x), r1=155(y), r2=94(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 155
LDI r2, 94
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
