; DESCRIPTION: Places a red 110x114 rectangle at position (46, 121).
; PLAN: r0=46(x), r1=121(y), r2=110(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 121
LDI r2, 110
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
