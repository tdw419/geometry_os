; DESCRIPTION: Creates a yellow rectangular region at (63, 35) spanning 40 by 86 pixels.
; PLAN: r0=63(x), r1=35(y), r2=40(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 35
LDI r2, 40
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
