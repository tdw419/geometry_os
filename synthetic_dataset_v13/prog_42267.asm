; DESCRIPTION: Places a magenta 51x115 rectangle at position (190, 90).
; PLAN: r0=190(x), r1=90(y), r2=51(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 90
LDI r2, 51
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
