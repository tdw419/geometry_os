; DESCRIPTION: Creates a green rectangular region at (46, 183) spanning 101 by 60 pixels.
; PLAN: r0=46(x), r1=183(y), r2=101(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 183
LDI r2, 101
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
