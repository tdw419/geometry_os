; DESCRIPTION: Places a white 29x118 rectangle at position (267, 82).
; PLAN: r0=267(x), r1=82(y), r2=29(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 82
LDI r2, 29
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
