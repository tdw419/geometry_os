; DESCRIPTION: Places a white 114x115 rectangle at position (267, 132).
; PLAN: r0=267(x), r1=132(y), r2=114(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 132
LDI r2, 114
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
