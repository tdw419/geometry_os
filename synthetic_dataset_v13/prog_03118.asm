; DESCRIPTION: Creates a purple rectangular region at (358, 74) spanning 46 by 44 pixels.
; PLAN: r0=358(x), r1=74(y), r2=46(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 74
LDI r2, 46
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
