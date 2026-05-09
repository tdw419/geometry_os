; DESCRIPTION: Creates a yellow rectangular region at (251, 29) spanning 103 by 118 pixels.
; PLAN: r0=251(x), r1=29(y), r2=103(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 29
LDI r2, 103
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
