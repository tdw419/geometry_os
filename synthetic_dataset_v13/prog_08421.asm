; DESCRIPTION: Places a blue 24x111 rectangle at position (141, 142).
; PLAN: r0=141(x), r1=142(y), r2=24(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 142
LDI r2, 24
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
