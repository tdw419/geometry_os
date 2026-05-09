; DESCRIPTION: Places a blue 91x80 rectangle at position (417, 48).
; PLAN: r0=417(x), r1=48(y), r2=91(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 48
LDI r2, 91
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
