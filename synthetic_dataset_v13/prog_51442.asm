; DESCRIPTION: Places a purple 32x41 rectangle at position (400, 205).
; PLAN: r0=400(x), r1=205(y), r2=32(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 205
LDI r2, 32
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
