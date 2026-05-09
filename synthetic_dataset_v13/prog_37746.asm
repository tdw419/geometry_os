; DESCRIPTION: Places a blue 98x114 rectangle at position (263, 107).
; PLAN: r0=263(x), r1=107(y), r2=98(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 107
LDI r2, 98
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
