; DESCRIPTION: Places a magenta 94x81 rectangle at position (327, 75).
; PLAN: r0=327(x), r1=75(y), r2=94(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 75
LDI r2, 94
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
