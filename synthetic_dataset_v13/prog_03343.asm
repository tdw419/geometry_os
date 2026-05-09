; DESCRIPTION: Places a blue 79x88 rectangle at position (75, 148).
; PLAN: r0=75(x), r1=148(y), r2=79(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 148
LDI r2, 79
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
