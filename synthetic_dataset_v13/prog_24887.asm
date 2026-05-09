; DESCRIPTION: Creates a green rectangular region at (331, 10) spanning 52 by 46 pixels.
; PLAN: r0=331(x), r1=10(y), r2=52(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 10
LDI r2, 52
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
