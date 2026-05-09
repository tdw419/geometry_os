; DESCRIPTION: Places a blue 86x36 rectangle at position (181, 39).
; PLAN: r0=181(x), r1=39(y), r2=86(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 39
LDI r2, 86
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
