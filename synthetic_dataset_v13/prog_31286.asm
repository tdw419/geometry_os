; DESCRIPTION: Creates a yellow rectangular region at (141, 154) spanning 107 by 80 pixels.
; PLAN: r0=141(x), r1=154(y), r2=107(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 154
LDI r2, 107
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
