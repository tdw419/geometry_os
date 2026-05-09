; DESCRIPTION: Creates a purple rectangular region at (327, 131) spanning 26 by 15 pixels.
; PLAN: r0=327(x), r1=131(y), r2=26(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 131
LDI r2, 26
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
