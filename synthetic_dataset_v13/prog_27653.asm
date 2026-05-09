; DESCRIPTION: Places a blue 112x65 rectangle at position (329, 78).
; PLAN: r0=329(x), r1=78(y), r2=112(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 78
LDI r2, 112
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
