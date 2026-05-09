; DESCRIPTION: Creates a black rectangular region at (51, 124) spanning 99 by 58 pixels.
; PLAN: r0=51(x), r1=124(y), r2=99(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 124
LDI r2, 99
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
