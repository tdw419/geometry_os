; DESCRIPTION: Creates a yellow rectangular region at (395, 145) spanning 10 by 65 pixels.
; PLAN: r0=395(x), r1=145(y), r2=10(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 145
LDI r2, 10
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
