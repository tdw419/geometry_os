; DESCRIPTION: Places a blue 74x46 rectangle at position (126, 125).
; PLAN: r0=126(x), r1=125(y), r2=74(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 125
LDI r2, 74
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
