; DESCRIPTION: Creates a yellow rectangular region at (314, 159) spanning 117 by 37 pixels.
; PLAN: r0=314(x), r1=159(y), r2=117(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 159
LDI r2, 117
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
