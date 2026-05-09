; DESCRIPTION: Creates a purple rectangular region at (171, 160) spanning 91 by 51 pixels.
; PLAN: r0=171(x), r1=160(y), r2=91(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 160
LDI r2, 91
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
