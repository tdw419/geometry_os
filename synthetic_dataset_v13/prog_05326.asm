; DESCRIPTION: Places a red 58x58 rectangle at position (319, 121).
; PLAN: r0=319(x), r1=121(y), r2=58(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 121
LDI r2, 58
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
