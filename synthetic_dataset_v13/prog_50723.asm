; DESCRIPTION: Places a blue 43x36 rectangle at position (437, 23).
; PLAN: r0=437(x), r1=23(y), r2=43(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 23
LDI r2, 43
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
