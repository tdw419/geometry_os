; DESCRIPTION: Places a blue 48x58 rectangle at position (96, 51).
; PLAN: r0=96(x), r1=51(y), r2=48(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 51
LDI r2, 48
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
