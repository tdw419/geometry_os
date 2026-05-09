; DESCRIPTION: Creates a yellow rectangular region at (311, 106) spanning 103 by 105 pixels.
; PLAN: r0=311(x), r1=106(y), r2=103(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 106
LDI r2, 103
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
