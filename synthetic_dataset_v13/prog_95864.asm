; DESCRIPTION: Places a purple 98x115 rectangle at position (267, 5).
; PLAN: r0=267(x), r1=5(y), r2=98(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 5
LDI r2, 98
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
