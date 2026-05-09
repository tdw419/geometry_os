; DESCRIPTION: Places a magenta 26x56 rectangle at position (185, 51).
; PLAN: r0=185(x), r1=51(y), r2=26(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 51
LDI r2, 26
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
