; DESCRIPTION: Creates a green rectangular region at (10, 148) spanning 32 by 14 pixels.
; PLAN: r0=10(x), r1=148(y), r2=32(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 148
LDI r2, 32
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
