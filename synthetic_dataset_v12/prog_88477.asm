; DESCRIPTION: Places a magenta 51x110 rectangle at position (195, 118).
; PLAN: r0=195(x), r1=118(y), r2=51(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 118
LDI r2, 51
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
