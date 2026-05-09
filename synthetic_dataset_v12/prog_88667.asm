; DESCRIPTION: Creates a yellow rectangular region at (32, 46) spanning 13 by 34 pixels.
; PLAN: r0=32(x), r1=46(y), r2=13(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 46
LDI r2, 13
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
