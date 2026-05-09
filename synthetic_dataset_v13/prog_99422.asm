; DESCRIPTION: Places a purple 20x110 rectangle at position (401, 86).
; PLAN: r0=401(x), r1=86(y), r2=20(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 86
LDI r2, 20
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
