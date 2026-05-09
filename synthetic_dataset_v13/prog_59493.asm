; DESCRIPTION: Places a magenta 109x47 rectangle at position (170, 87).
; PLAN: r0=170(x), r1=87(y), r2=109(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 87
LDI r2, 109
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
