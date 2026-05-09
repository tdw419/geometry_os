; DESCRIPTION: Places a blue 87x92 rectangle at position (7, 153).
; PLAN: r0=7(x), r1=153(y), r2=87(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 153
LDI r2, 87
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
