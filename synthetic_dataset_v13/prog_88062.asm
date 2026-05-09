; DESCRIPTION: Places a yellow 13x118 rectangle at position (171, 102).
; PLAN: r0=171(x), r1=102(y), r2=13(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 102
LDI r2, 13
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
