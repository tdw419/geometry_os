; DESCRIPTION: Creates a purple rectangular region at (45, 114) spanning 57 by 14 pixels.
; PLAN: r0=45(x), r1=114(y), r2=57(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 114
LDI r2, 57
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
