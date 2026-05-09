; DESCRIPTION: Places a blue 80x25 rectangle at position (125, 2).
; PLAN: r0=125(x), r1=2(y), r2=80(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 2
LDI r2, 80
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
