; DESCRIPTION: Places a purple 26x40 rectangle at position (457, 47).
; PLAN: r0=457(x), r1=47(y), r2=26(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 47
LDI r2, 26
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
