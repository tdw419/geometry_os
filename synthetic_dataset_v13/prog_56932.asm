; DESCRIPTION: Places a blue 20x95 rectangle at position (7, 148).
; PLAN: r0=7(x), r1=148(y), r2=20(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 148
LDI r2, 20
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
