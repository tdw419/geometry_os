; DESCRIPTION: Places a purple 47x19 rectangle at position (170, 138).
; PLAN: r0=170(x), r1=138(y), r2=47(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 138
LDI r2, 47
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
