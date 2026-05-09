; DESCRIPTION: Places a purple 107x57 rectangle at position (288, 10).
; PLAN: r0=288(x), r1=10(y), r2=107(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 10
LDI r2, 107
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
