; DESCRIPTION: Places a magenta 51x101 rectangle at position (340, 95).
; PLAN: r0=340(x), r1=95(y), r2=51(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 95
LDI r2, 51
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
