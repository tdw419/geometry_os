; DESCRIPTION: Places a black 85x32 rectangle at position (47, 121).
; PLAN: r0=47(x), r1=121(y), r2=85(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 121
LDI r2, 85
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
