; DESCRIPTION: Places a blue 118x111 rectangle at position (71, 10).
; PLAN: r0=71(x), r1=10(y), r2=118(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 10
LDI r2, 118
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
