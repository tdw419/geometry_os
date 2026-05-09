; DESCRIPTION: Places a blue 35x40 rectangle at position (446, 159).
; PLAN: r0=446(x), r1=159(y), r2=35(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 159
LDI r2, 35
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
