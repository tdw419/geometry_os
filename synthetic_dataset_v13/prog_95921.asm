; DESCRIPTION: Creates a black rectangular region at (196, 11) spanning 46 by 118 pixels.
; PLAN: r0=196(x), r1=11(y), r2=46(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 11
LDI r2, 46
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
