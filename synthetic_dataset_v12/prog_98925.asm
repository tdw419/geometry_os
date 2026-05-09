; DESCRIPTION: Creates a green rectangular region at (412, 117) spanning 100 by 61 pixels.
; PLAN: r0=412(x), r1=117(y), r2=100(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 117
LDI r2, 100
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
