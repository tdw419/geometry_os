; DESCRIPTION: Creates a purple rectangular region at (493, 166) spanning 17 by 44 pixels.
; PLAN: r0=493(x), r1=166(y), r2=17(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 166
LDI r2, 17
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
