; DESCRIPTION: Places a blue 99x48 rectangle at position (358, 78).
; PLAN: r0=358(x), r1=78(y), r2=99(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 78
LDI r2, 99
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
