; DESCRIPTION: Places a blue 98x35 rectangle at position (324, 193).
; PLAN: r0=324(x), r1=193(y), r2=98(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 193
LDI r2, 98
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
