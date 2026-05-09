; DESCRIPTION: Places a purple 40x80 rectangle at position (186, 74).
; PLAN: r0=186(x), r1=74(y), r2=40(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 74
LDI r2, 40
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
