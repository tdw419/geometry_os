; DESCRIPTION: Creates a yellow rectangular region at (138, 23) spanning 103 by 63 pixels.
; PLAN: r0=138(x), r1=23(y), r2=103(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 23
LDI r2, 103
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
