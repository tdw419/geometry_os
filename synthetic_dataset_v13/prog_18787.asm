; DESCRIPTION: Places a magenta 94x80 rectangle at position (226, 115).
; PLAN: r0=226(x), r1=115(y), r2=94(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 115
LDI r2, 94
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
