; DESCRIPTION: Places a magenta 64x94 rectangle at position (230, 125).
; PLAN: r0=230(x), r1=125(y), r2=64(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 125
LDI r2, 64
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
