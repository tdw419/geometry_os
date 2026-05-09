; DESCRIPTION: Places a purple 40x24 rectangle at position (245, 119).
; PLAN: r0=245(x), r1=119(y), r2=40(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 119
LDI r2, 40
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
