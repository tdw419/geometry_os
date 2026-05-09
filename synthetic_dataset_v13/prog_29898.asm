; DESCRIPTION: Creates a green rectangular region at (174, 234) spanning 36 by 20 pixels.
; PLAN: r0=174(x), r1=234(y), r2=36(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 234
LDI r2, 36
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
