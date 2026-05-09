; DESCRIPTION: Creates a yellow rectangular region at (290, 32) spanning 10 by 108 pixels.
; PLAN: r0=290(x), r1=32(y), r2=10(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 32
LDI r2, 10
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
