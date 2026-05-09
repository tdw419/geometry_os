; DESCRIPTION: Places a purple 48x71 rectangle at position (451, 32).
; PLAN: r0=451(x), r1=32(y), r2=48(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 32
LDI r2, 48
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
