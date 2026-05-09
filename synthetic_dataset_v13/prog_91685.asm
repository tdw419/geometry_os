; DESCRIPTION: Places a purple 106x38 rectangle at position (358, 123).
; PLAN: r0=358(x), r1=123(y), r2=106(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 123
LDI r2, 106
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
