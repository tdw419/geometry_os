; DESCRIPTION: Places a purple 75x102 rectangle at position (321, 136).
; PLAN: r0=321(x), r1=136(y), r2=75(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 136
LDI r2, 75
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
