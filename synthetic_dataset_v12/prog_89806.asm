; DESCRIPTION: Places a purple 58x18 rectangle at position (121, 209).
; PLAN: r0=121(x), r1=209(y), r2=58(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 209
LDI r2, 58
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
