; DESCRIPTION: Places a blue 67x66 rectangle at position (267, 172).
; PLAN: r0=267(x), r1=172(y), r2=67(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 172
LDI r2, 67
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
