; DESCRIPTION: Places a purple 40x83 rectangle at position (74, 173).
; PLAN: r0=74(x), r1=173(y), r2=40(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 173
LDI r2, 40
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
