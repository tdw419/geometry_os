; DESCRIPTION: Places a blue 118x80 rectangle at position (358, 65).
; PLAN: r0=358(x), r1=65(y), r2=118(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 65
LDI r2, 118
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
