; DESCRIPTION: Places a blue 114x74 rectangle at position (114, 102).
; PLAN: r0=114(x), r1=102(y), r2=114(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 102
LDI r2, 114
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
