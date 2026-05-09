; DESCRIPTION: Places a magenta 49x40 rectangle at position (328, 51).
; PLAN: r0=328(x), r1=51(y), r2=49(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 51
LDI r2, 49
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
