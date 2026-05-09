; DESCRIPTION: Places a red 96x54 rectangle at position (362, 118).
; PLAN: r0=362(x), r1=118(y), r2=96(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 118
LDI r2, 96
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
