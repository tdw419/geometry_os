; DESCRIPTION: Places a purple 40x14 rectangle at position (44, 189).
; PLAN: r0=44(x), r1=189(y), r2=40(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 189
LDI r2, 40
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
