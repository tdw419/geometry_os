; DESCRIPTION: Creates a green rectangular region at (148, 3) spanning 57 by 103 pixels.
; PLAN: r0=148(x), r1=3(y), r2=57(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 3
LDI r2, 57
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
