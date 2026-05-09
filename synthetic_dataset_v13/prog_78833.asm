; DESCRIPTION: Places a magenta 115x74 rectangle at position (60, 125).
; PLAN: r0=60(x), r1=125(y), r2=115(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 125
LDI r2, 115
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
