; DESCRIPTION: Places a blue 84x78 rectangle at position (319, 171).
; PLAN: r0=319(x), r1=171(y), r2=84(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 171
LDI r2, 84
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
