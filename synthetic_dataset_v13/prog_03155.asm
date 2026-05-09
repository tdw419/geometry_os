; DESCRIPTION: Places a purple 43x54 rectangle at position (83, 40).
; PLAN: r0=83(x), r1=40(y), r2=43(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 40
LDI r2, 43
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
