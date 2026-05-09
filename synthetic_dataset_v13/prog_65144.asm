; DESCRIPTION: Creates a green rectangular region at (28, 30) spanning 69 by 63 pixels.
; PLAN: r0=28(x), r1=30(y), r2=69(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 30
LDI r2, 69
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
