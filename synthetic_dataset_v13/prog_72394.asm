; DESCRIPTION: Places a blue 57x51 rectangle at position (20, 113).
; PLAN: r0=20(x), r1=113(y), r2=57(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 113
LDI r2, 57
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
