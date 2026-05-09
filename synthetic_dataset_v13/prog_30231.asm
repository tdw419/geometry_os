; DESCRIPTION: Creates a purple rectangular region at (362, 76) spanning 36 by 83 pixels.
; PLAN: r0=362(x), r1=76(y), r2=36(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 76
LDI r2, 36
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
