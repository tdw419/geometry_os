; DESCRIPTION: Creates a purple rectangular region at (287, 131) spanning 50 by 96 pixels.
; PLAN: r0=287(x), r1=131(y), r2=50(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 131
LDI r2, 50
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
