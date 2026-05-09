; DESCRIPTION: Places a blue 56x36 rectangle at position (73, 163).
; PLAN: r0=73(x), r1=163(y), r2=56(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 163
LDI r2, 56
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
