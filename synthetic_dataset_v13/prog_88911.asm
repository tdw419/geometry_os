; DESCRIPTION: Places a blue 51x106 rectangle at position (127, 2).
; PLAN: r0=127(x), r1=2(y), r2=51(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 2
LDI r2, 51
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
