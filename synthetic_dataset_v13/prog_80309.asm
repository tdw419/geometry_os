; DESCRIPTION: Places a magenta 51x11 rectangle at position (408, 2).
; PLAN: r0=408(x), r1=2(y), r2=51(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 2
LDI r2, 51
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
