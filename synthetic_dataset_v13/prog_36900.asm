; DESCRIPTION: Places a purple 40x57 rectangle at position (115, 65).
; PLAN: r0=115(x), r1=65(y), r2=40(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 65
LDI r2, 40
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
