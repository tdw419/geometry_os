; DESCRIPTION: Places a blue 93x66 rectangle at position (403, 81).
; PLAN: r0=403(x), r1=81(y), r2=93(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 81
LDI r2, 93
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
