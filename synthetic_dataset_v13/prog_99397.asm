; DESCRIPTION: Creates a yellow rectangular region at (148, 54) spanning 117 by 86 pixels.
; PLAN: r0=148(x), r1=54(y), r2=117(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 54
LDI r2, 117
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
