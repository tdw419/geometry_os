; DESCRIPTION: Creates a yellow rectangular region at (319, 103) spanning 19 by 107 pixels.
; PLAN: r0=319(x), r1=103(y), r2=19(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 103
LDI r2, 19
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
