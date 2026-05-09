; DESCRIPTION: Places a blue 99x51 rectangle at position (32, 36).
; PLAN: r0=32(x), r1=36(y), r2=99(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 36
LDI r2, 99
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
