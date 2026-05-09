; DESCRIPTION: Creates a yellow rectangular region at (241, 109) spanning 46 by 51 pixels.
; PLAN: r0=241(x), r1=109(y), r2=46(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 109
LDI r2, 46
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
