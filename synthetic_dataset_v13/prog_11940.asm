; DESCRIPTION: Places a magenta 115x59 rectangle at position (291, 51).
; PLAN: r0=291(x), r1=51(y), r2=115(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 51
LDI r2, 115
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
