; DESCRIPTION: Creates a purple rectangular region at (172, 51) spanning 61 by 59 pixels.
; PLAN: r0=172(x), r1=51(y), r2=61(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 51
LDI r2, 61
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
