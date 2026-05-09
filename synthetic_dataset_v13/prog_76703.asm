; DESCRIPTION: Places a purple 39x70 rectangle at position (241, 148).
; PLAN: r0=241(x), r1=148(y), r2=39(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 148
LDI r2, 39
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
