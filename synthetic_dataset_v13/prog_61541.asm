; DESCRIPTION: Places a blue 51x70 rectangle at position (68, 30).
; PLAN: r0=68(x), r1=30(y), r2=51(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 30
LDI r2, 51
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
