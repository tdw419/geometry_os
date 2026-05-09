; DESCRIPTION: Places a red 23x49 rectangle at position (262, 51).
; PLAN: r0=262(x), r1=51(y), r2=23(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 51
LDI r2, 23
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
