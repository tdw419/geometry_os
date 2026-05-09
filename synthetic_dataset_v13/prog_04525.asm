; DESCRIPTION: Places a red 92x26 rectangle at position (99, 66).
; PLAN: r0=99(x), r1=66(y), r2=92(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 66
LDI r2, 92
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
