; DESCRIPTION: Places a purple 112x74 rectangle at position (386, 170).
; PLAN: r0=386(x), r1=170(y), r2=112(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 170
LDI r2, 112
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
