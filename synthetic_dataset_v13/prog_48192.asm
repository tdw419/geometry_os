; DESCRIPTION: Places a blue 77x56 rectangle at position (267, 186).
; PLAN: r0=267(x), r1=186(y), r2=77(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 186
LDI r2, 77
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
