; DESCRIPTION: Creates a purple rectangular region at (286, 35) spanning 92 by 27 pixels.
; PLAN: r0=286(x), r1=35(y), r2=92(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 35
LDI r2, 92
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
