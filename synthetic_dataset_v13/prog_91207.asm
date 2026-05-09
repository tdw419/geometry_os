; DESCRIPTION: Creates a yellow rectangular region at (253, 160) spanning 14 by 94 pixels.
; PLAN: r0=253(x), r1=160(y), r2=14(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 160
LDI r2, 14
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
