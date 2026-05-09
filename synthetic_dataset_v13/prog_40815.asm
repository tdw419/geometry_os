; DESCRIPTION: Places a magenta 102x114 rectangle at position (277, 118).
; PLAN: r0=277(x), r1=118(y), r2=102(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 118
LDI r2, 102
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
