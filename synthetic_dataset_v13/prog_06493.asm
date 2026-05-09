; DESCRIPTION: Places a purple 78x74 rectangle at position (260, 37).
; PLAN: r0=260(x), r1=37(y), r2=78(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 37
LDI r2, 78
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
