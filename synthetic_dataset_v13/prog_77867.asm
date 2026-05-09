; DESCRIPTION: Places a green 49x70 rectangle at position (389, 109).
; PLAN: r0=389(x), r1=109(y), r2=49(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 109
LDI r2, 49
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
