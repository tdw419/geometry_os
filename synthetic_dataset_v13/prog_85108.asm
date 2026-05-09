; DESCRIPTION: Places a blue 107x115 rectangle at position (274, 66).
; PLAN: r0=274(x), r1=66(y), r2=107(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 66
LDI r2, 107
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
