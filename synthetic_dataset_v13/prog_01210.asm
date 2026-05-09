; DESCRIPTION: Creates a purple rectangular region at (399, 17) spanning 27 by 80 pixels.
; PLAN: r0=399(x), r1=17(y), r2=27(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 17
LDI r2, 27
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
