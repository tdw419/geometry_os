; DESCRIPTION: Places a blue 112x80 rectangle at position (220, 71).
; PLAN: r0=220(x), r1=71(y), r2=112(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 71
LDI r2, 112
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
