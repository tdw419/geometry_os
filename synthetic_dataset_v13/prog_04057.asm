; DESCRIPTION: Places a purple 46x30 rectangle at position (292, 107).
; PLAN: r0=292(x), r1=107(y), r2=46(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 107
LDI r2, 46
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
