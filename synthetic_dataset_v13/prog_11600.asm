; DESCRIPTION: Creates a purple rectangular region at (40, 107) spanning 44 by 114 pixels.
; PLAN: r0=40(x), r1=107(y), r2=44(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 107
LDI r2, 44
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
