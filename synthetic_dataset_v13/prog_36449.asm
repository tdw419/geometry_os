; DESCRIPTION: Places a red 92x94 rectangle at position (52, 121).
; PLAN: r0=52(x), r1=121(y), r2=92(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 121
LDI r2, 92
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
