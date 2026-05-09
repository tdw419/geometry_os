; DESCRIPTION: Places a purple 43x87 rectangle at position (108, 77).
; PLAN: r0=108(x), r1=77(y), r2=43(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 77
LDI r2, 43
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
