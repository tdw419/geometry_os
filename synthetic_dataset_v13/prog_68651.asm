; DESCRIPTION: Places a purple 43x70 rectangle at position (321, 62).
; PLAN: r0=321(x), r1=62(y), r2=43(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 62
LDI r2, 43
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
