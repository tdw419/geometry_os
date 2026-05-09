; DESCRIPTION: Places a magenta 15x26 rectangle at position (216, 138).
; PLAN: r0=216(x), r1=138(y), r2=15(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 138
LDI r2, 15
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
