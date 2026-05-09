; DESCRIPTION: Creates a purple rectangular region at (58, 138) spanning 27 by 40 pixels.
; PLAN: r0=58(x), r1=138(y), r2=27(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 138
LDI r2, 27
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
