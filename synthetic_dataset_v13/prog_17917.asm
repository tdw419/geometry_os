; DESCRIPTION: Places a purple 102x108 rectangle at position (324, 54).
; PLAN: r0=324(x), r1=54(y), r2=102(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 54
LDI r2, 102
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
