; DESCRIPTION: Creates a black rectangular region at (144, 138) spanning 51 by 99 pixels.
; PLAN: r0=144(x), r1=138(y), r2=51(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 138
LDI r2, 51
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
