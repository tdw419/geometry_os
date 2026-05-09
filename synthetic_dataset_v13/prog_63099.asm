; DESCRIPTION: Places a magenta 28x30 rectangle at position (455, 66).
; PLAN: r0=455(x), r1=66(y), r2=28(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 66
LDI r2, 28
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
