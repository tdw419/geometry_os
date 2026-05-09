; DESCRIPTION: Places a magenta 26x29 rectangle at position (71, 162).
; PLAN: r0=71(x), r1=162(y), r2=26(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 162
LDI r2, 26
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
