; DESCRIPTION: Places a white 75x93 rectangle at position (246, 84).
; PLAN: r0=246(x), r1=84(y), r2=75(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 84
LDI r2, 75
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
