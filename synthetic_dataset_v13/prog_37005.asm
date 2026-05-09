; DESCRIPTION: Creates a yellow rectangular region at (215, 192) spanning 112 by 15 pixels.
; PLAN: r0=215(x), r1=192(y), r2=112(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 192
LDI r2, 112
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
