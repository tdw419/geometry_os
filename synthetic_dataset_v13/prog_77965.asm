; DESCRIPTION: Places a magenta 80x80 rectangle at position (192, 155).
; PLAN: r0=192(x), r1=155(y), r2=80(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 155
LDI r2, 80
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
