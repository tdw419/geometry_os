; DESCRIPTION: Creates a purple rectangular region at (391, 200) spanning 93 by 15 pixels.
; PLAN: r0=391(x), r1=200(y), r2=93(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 200
LDI r2, 93
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
