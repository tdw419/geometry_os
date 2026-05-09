; DESCRIPTION: Places a magenta 51x60 rectangle at position (319, 30).
; PLAN: r0=319(x), r1=30(y), r2=51(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 30
LDI r2, 51
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
