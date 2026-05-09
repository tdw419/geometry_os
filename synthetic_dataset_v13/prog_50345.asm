; DESCRIPTION: Places a blue 114x85 rectangle at position (172, 125).
; PLAN: r0=172(x), r1=125(y), r2=114(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 125
LDI r2, 114
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
