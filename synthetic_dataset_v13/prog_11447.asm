; DESCRIPTION: Creates a green rectangular region at (271, 21) spanning 88 by 64 pixels.
; PLAN: r0=271(x), r1=21(y), r2=88(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 21
LDI r2, 88
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
