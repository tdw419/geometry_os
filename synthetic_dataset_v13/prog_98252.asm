; DESCRIPTION: Places a blue 79x118 rectangle at position (17, 48).
; PLAN: r0=17(x), r1=48(y), r2=79(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 48
LDI r2, 79
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
