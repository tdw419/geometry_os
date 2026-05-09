; DESCRIPTION: Places a blue 14x75 rectangle at position (125, 165).
; PLAN: r0=125(x), r1=165(y), r2=14(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 165
LDI r2, 14
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
