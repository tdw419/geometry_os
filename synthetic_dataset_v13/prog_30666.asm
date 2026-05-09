; DESCRIPTION: Places a blue 33x43 rectangle at position (125, 79).
; PLAN: r0=125(x), r1=79(y), r2=33(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 79
LDI r2, 33
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
