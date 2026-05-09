; DESCRIPTION: Places a white 63x93 rectangle at position (228, 58).
; PLAN: r0=228(x), r1=58(y), r2=63(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 58
LDI r2, 63
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
