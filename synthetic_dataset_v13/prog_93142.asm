; DESCRIPTION: Places a blue 24x94 rectangle at position (77, 141).
; PLAN: r0=77(x), r1=141(y), r2=24(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 141
LDI r2, 24
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
