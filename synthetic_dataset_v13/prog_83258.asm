; DESCRIPTION: Places a blue 63x114 rectangle at position (241, 114).
; PLAN: r0=241(x), r1=114(y), r2=63(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 114
LDI r2, 63
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
