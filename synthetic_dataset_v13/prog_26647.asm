; DESCRIPTION: Creates a yellow rectangular region at (223, 127) spanning 23 by 73 pixels.
; PLAN: r0=223(x), r1=127(y), r2=23(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 127
LDI r2, 23
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
