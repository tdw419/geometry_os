; DESCRIPTION: Creates a red rectangular region at (101, 51) spanning 61 by 58 pixels.
; PLAN: r0=101(x), r1=51(y), r2=61(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 51
LDI r2, 61
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
