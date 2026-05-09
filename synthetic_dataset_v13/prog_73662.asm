; DESCRIPTION: Creates a green rectangular region at (254, 160) spanning 33 by 61 pixels.
; PLAN: r0=254(x), r1=160(y), r2=33(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 160
LDI r2, 33
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
