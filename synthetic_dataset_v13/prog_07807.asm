; DESCRIPTION: Creates a yellow rectangular region at (13, 144) spanning 54 by 86 pixels.
; PLAN: r0=13(x), r1=144(y), r2=54(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 144
LDI r2, 54
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
