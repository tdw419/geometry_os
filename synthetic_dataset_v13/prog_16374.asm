; DESCRIPTION: Places a purple 110x98 rectangle at position (121, 156).
; PLAN: r0=121(x), r1=156(y), r2=110(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 156
LDI r2, 110
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
