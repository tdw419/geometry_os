; DESCRIPTION: Places a purple 46x53 rectangle at position (105, 23).
; PLAN: r0=105(x), r1=23(y), r2=46(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 23
LDI r2, 46
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
