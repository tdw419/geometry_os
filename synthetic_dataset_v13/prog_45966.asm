; DESCRIPTION: Creates a purple rectangular region at (112, 151) spanning 98 by 25 pixels.
; PLAN: r0=112(x), r1=151(y), r2=98(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 151
LDI r2, 98
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
