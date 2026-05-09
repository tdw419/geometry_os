; DESCRIPTION: Places a blue 51x99 rectangle at position (345, 133).
; PLAN: r0=345(x), r1=133(y), r2=51(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 133
LDI r2, 51
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
