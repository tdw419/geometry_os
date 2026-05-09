; DESCRIPTION: Creates a purple rectangular region at (287, 146) spanning 74 by 49 pixels.
; PLAN: r0=287(x), r1=146(y), r2=74(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 146
LDI r2, 74
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
