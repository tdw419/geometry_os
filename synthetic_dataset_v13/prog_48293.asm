; DESCRIPTION: Places a blue 56x92 rectangle at position (145, 155).
; PLAN: r0=145(x), r1=155(y), r2=56(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 155
LDI r2, 56
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
