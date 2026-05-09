; DESCRIPTION: Places a red 23x85 rectangle at position (362, 131).
; PLAN: r0=362(x), r1=131(y), r2=23(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 131
LDI r2, 23
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
