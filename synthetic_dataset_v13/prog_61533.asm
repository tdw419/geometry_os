; DESCRIPTION: Places a blue 101x43 rectangle at position (367, 119).
; PLAN: r0=367(x), r1=119(y), r2=101(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 119
LDI r2, 101
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
