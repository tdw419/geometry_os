; DESCRIPTION: Creates a purple rectangular region at (53, 142) spanning 47 by 74 pixels.
; PLAN: r0=53(x), r1=142(y), r2=47(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 142
LDI r2, 47
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
