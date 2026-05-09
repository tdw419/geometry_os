; DESCRIPTION: Places a black 36x100 rectangle at position (306, 96).
; PLAN: r0=306(x), r1=96(y), r2=36(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 96
LDI r2, 36
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
