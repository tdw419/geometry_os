; DESCRIPTION: Places a red 98x101 rectangle at position (96, 15).
; PLAN: r0=96(x), r1=15(y), r2=98(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 15
LDI r2, 98
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
