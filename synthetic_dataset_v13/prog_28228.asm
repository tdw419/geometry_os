; DESCRIPTION: Places a purple 12x22 rectangle at position (317, 13).
; PLAN: r0=317(x), r1=13(y), r2=12(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 13
LDI r2, 12
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
