; DESCRIPTION: Places a purple 47x107 rectangle at position (0, 149).
; PLAN: r0=0(x), r1=149(y), r2=47(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 149
LDI r2, 47
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
