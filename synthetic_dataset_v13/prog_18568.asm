; DESCRIPTION: Places a blue 59x57 rectangle at position (324, 104).
; PLAN: r0=324(x), r1=104(y), r2=59(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 104
LDI r2, 59
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
