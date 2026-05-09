; DESCRIPTION: Creates a yellow rectangular region at (144, 154) spanning 20 by 19 pixels.
; PLAN: r0=144(x), r1=154(y), r2=20(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 154
LDI r2, 20
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
