; DESCRIPTION: Creates a purple rectangular region at (362, 117) spanning 112 by 35 pixels.
; PLAN: r0=362(x), r1=117(y), r2=112(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 117
LDI r2, 112
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
