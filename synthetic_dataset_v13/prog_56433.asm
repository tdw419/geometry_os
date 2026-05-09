; DESCRIPTION: Creates a purple rectangular region at (362, 146) spanning 89 by 35 pixels.
; PLAN: r0=362(x), r1=146(y), r2=89(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 146
LDI r2, 89
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
