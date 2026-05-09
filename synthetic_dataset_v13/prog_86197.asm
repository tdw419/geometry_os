; DESCRIPTION: Places a blue 33x92 rectangle at position (132, 50).
; PLAN: r0=132(x), r1=50(y), r2=33(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 50
LDI r2, 33
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
