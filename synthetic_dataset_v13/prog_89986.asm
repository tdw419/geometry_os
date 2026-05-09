; DESCRIPTION: Creates a red rectangular region at (333, 35) spanning 25 by 51 pixels.
; PLAN: r0=333(x), r1=35(y), r2=25(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 35
LDI r2, 25
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
