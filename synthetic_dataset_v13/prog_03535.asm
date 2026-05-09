; DESCRIPTION: Places a magenta 101x118 rectangle at position (2, 91).
; PLAN: r0=2(x), r1=91(y), r2=101(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 91
LDI r2, 101
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
