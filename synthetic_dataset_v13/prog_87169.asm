; DESCRIPTION: Places a blue 107x60 rectangle at position (233, 1).
; PLAN: r0=233(x), r1=1(y), r2=107(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 1
LDI r2, 107
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
