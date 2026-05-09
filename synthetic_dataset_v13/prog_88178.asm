; DESCRIPTION: Places a blue 111x94 rectangle at position (191, 106).
; PLAN: r0=191(x), r1=106(y), r2=111(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 106
LDI r2, 111
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
