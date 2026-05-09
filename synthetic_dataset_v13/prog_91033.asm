; DESCRIPTION: Creates a yellow rectangular region at (245, 118) spanning 105 by 103 pixels.
; PLAN: r0=245(x), r1=118(y), r2=105(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 118
LDI r2, 105
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
