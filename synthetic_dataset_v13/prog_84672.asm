; DESCRIPTION: Places a magenta 18x111 rectangle at position (51, 23).
; PLAN: r0=51(x), r1=23(y), r2=18(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 23
LDI r2, 18
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
