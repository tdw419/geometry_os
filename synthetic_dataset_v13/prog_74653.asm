; DESCRIPTION: Creates a purple rectangular region at (317, 107) spanning 36 by 112 pixels.
; PLAN: r0=317(x), r1=107(y), r2=36(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 107
LDI r2, 36
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
