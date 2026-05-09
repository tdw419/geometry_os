; DESCRIPTION: Places a red 115x46 rectangle at position (1, 96).
; PLAN: r0=1(x), r1=96(y), r2=115(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 96
LDI r2, 115
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
