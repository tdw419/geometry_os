; DESCRIPTION: Places a blue 94x87 rectangle at position (280, 114).
; PLAN: r0=280(x), r1=114(y), r2=94(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 114
LDI r2, 94
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
