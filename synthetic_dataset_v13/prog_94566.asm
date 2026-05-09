; DESCRIPTION: Places a blue 37x27 rectangle at position (193, 24).
; PLAN: r0=193(x), r1=24(y), r2=37(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 24
LDI r2, 37
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
