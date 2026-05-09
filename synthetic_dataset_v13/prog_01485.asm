; DESCRIPTION: Places a blue 62x17 rectangle at position (315, 220).
; PLAN: r0=315(x), r1=220(y), r2=62(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 220
LDI r2, 62
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
