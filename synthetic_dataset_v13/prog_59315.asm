; DESCRIPTION: Places a blue 86x100 rectangle at position (36, 135).
; PLAN: r0=36(x), r1=135(y), r2=86(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 135
LDI r2, 86
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
