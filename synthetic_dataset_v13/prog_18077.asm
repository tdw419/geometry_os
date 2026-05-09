; DESCRIPTION: Places a purple 49x24 rectangle at position (125, 214).
; PLAN: r0=125(x), r1=214(y), r2=49(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 214
LDI r2, 49
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
