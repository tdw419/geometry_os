; DESCRIPTION: Creates a green rectangular region at (145, 19) spanning 86 by 45 pixels.
; PLAN: r0=145(x), r1=19(y), r2=86(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 19
LDI r2, 86
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
