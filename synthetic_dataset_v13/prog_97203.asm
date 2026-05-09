; DESCRIPTION: Places a blue 86x84 rectangle at position (317, 18).
; PLAN: r0=317(x), r1=18(y), r2=86(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 18
LDI r2, 86
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
