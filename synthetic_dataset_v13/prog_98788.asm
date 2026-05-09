; DESCRIPTION: Places a blue 68x56 rectangle at position (226, 19).
; PLAN: r0=226(x), r1=19(y), r2=68(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 19
LDI r2, 68
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
