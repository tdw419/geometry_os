; DESCRIPTION: Creates a purple rectangular region at (321, 222) spanning 27 by 18 pixels.
; PLAN: r0=321(x), r1=222(y), r2=27(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 222
LDI r2, 27
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
