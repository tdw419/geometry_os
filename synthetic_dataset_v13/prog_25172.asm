; DESCRIPTION: Creates a purple rectangular region at (36, 80) spanning 27 by 105 pixels.
; PLAN: r0=36(x), r1=80(y), r2=27(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 80
LDI r2, 27
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
