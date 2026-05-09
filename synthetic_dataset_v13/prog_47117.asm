; DESCRIPTION: Creates a yellow rectangular region at (213, 2) spanning 65 by 99 pixels.
; PLAN: r0=213(x), r1=2(y), r2=65(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 2
LDI r2, 65
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
