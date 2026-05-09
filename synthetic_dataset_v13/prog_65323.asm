; DESCRIPTION: Creates a yellow rectangular region at (222, 26) spanning 64 by 112 pixels.
; PLAN: r0=222(x), r1=26(y), r2=64(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 26
LDI r2, 64
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
