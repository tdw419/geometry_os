; DESCRIPTION: Places a red 30x118 rectangle at position (17, 46).
; PLAN: r0=17(x), r1=46(y), r2=30(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 46
LDI r2, 30
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
