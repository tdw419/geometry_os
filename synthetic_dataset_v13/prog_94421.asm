; DESCRIPTION: Creates a yellow rectangular region at (214, 187) spanning 43 by 49 pixels.
; PLAN: r0=214(x), r1=187(y), r2=43(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 187
LDI r2, 43
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
