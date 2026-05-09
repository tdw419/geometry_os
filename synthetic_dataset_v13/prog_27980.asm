; DESCRIPTION: Places a blue 35x86 rectangle at position (52, 155).
; PLAN: r0=52(x), r1=155(y), r2=35(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 155
LDI r2, 35
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
