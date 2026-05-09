; DESCRIPTION: Places a purple 40x16 rectangle at position (325, 46).
; PLAN: r0=325(x), r1=46(y), r2=40(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 46
LDI r2, 40
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
