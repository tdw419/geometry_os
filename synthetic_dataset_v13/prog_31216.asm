; DESCRIPTION: Places a purple 43x36 rectangle at position (40, 190).
; PLAN: r0=40(x), r1=190(y), r2=43(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 190
LDI r2, 43
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
