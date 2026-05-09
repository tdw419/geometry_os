; DESCRIPTION: Creates a green rectangular region at (23, 229) spanning 90 by 11 pixels.
; PLAN: r0=23(x), r1=229(y), r2=90(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 229
LDI r2, 90
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
