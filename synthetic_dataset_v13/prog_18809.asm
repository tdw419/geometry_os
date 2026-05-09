; DESCRIPTION: Places a purple 65x108 rectangle at position (318, 96).
; PLAN: r0=318(x), r1=96(y), r2=65(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 96
LDI r2, 65
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
