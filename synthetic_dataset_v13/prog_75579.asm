; DESCRIPTION: Creates a yellow rectangular region at (102, 127) spanning 99 by 63 pixels.
; PLAN: r0=102(x), r1=127(y), r2=99(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 127
LDI r2, 99
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
