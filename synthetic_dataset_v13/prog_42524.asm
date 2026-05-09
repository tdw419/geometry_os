; DESCRIPTION: Creates a yellow rectangular region at (314, 126) spanning 113 by 110 pixels.
; PLAN: r0=314(x), r1=126(y), r2=113(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 126
LDI r2, 113
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
