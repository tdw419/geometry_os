; DESCRIPTION: Places a purple 46x40 rectangle at position (249, 98).
; PLAN: r0=249(x), r1=98(y), r2=46(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 98
LDI r2, 46
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
