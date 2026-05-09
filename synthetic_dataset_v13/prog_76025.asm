; DESCRIPTION: Creates a purple rectangular region at (352, 95) spanning 23 by 44 pixels.
; PLAN: r0=352(x), r1=95(y), r2=23(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 95
LDI r2, 23
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
