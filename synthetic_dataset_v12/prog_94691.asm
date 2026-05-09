; DESCRIPTION: Places a purple 74x17 rectangle at position (209, 138).
; PLAN: r0=209(x), r1=138(y), r2=74(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 138
LDI r2, 74
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
