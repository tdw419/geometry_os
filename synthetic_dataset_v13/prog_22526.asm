; DESCRIPTION: Creates a yellow rectangular region at (149, 107) spanning 37 by 58 pixels.
; PLAN: r0=149(x), r1=107(y), r2=37(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 107
LDI r2, 37
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
