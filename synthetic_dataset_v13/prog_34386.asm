; DESCRIPTION: Places a blue 20x19 rectangle at position (120, 2).
; PLAN: r0=120(x), r1=2(y), r2=20(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 2
LDI r2, 20
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
