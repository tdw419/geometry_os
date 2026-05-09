; DESCRIPTION: Creates a purple rectangular region at (352, 96) spanning 11 by 45 pixels.
; PLAN: r0=352(x), r1=96(y), r2=11(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 96
LDI r2, 11
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
