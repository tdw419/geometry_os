; DESCRIPTION: Creates a green rectangular region at (103, 31) spanning 103 by 112 pixels.
; PLAN: r0=103(x), r1=31(y), r2=103(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 31
LDI r2, 103
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
