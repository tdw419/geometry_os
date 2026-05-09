; DESCRIPTION: Places a blue 24x48 rectangle at position (426, 93).
; PLAN: r0=426(x), r1=93(y), r2=24(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 93
LDI r2, 24
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
