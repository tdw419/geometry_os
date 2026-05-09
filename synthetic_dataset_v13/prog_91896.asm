; DESCRIPTION: Creates a yellow rectangular region at (260, 49) spanning 71 by 14 pixels.
; PLAN: r0=260(x), r1=49(y), r2=71(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 49
LDI r2, 71
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
