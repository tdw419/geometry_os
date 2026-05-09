; DESCRIPTION: Places a blue 51x60 rectangle at position (56, 21).
; PLAN: r0=56(x), r1=21(y), r2=51(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 21
LDI r2, 51
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
