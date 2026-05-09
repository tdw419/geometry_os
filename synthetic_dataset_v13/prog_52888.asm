; DESCRIPTION: Places a red 65x115 rectangle at position (2, 81).
; PLAN: r0=2(x), r1=81(y), r2=65(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 81
LDI r2, 65
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
