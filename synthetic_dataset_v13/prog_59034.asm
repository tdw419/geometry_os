; DESCRIPTION: Places a blue 117x37 rectangle at position (226, 86).
; PLAN: r0=226(x), r1=86(y), r2=117(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 86
LDI r2, 117
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
