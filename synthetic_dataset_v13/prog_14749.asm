; DESCRIPTION: Places a purple 34x89 rectangle at position (198, 12).
; PLAN: r0=198(x), r1=12(y), r2=34(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 12
LDI r2, 34
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
