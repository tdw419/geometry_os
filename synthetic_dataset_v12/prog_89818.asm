; DESCRIPTION: Places a purple 31x68 rectangle at position (267, 48).
; PLAN: r0=267(x), r1=48(y), r2=31(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 48
LDI r2, 31
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
