; DESCRIPTION: Places a blue 13x77 rectangle at position (159, 75).
; PLAN: r0=159(x), r1=75(y), r2=13(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 75
LDI r2, 13
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
