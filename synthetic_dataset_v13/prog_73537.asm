; DESCRIPTION: Places a purple 41x20 rectangle at position (317, 102).
; PLAN: r0=317(x), r1=102(y), r2=41(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 102
LDI r2, 41
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
