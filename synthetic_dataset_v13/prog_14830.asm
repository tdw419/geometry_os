; DESCRIPTION: Creates a blue rectangular region at (35, 10) spanning 46 by 91 pixels.
; PLAN: r0=35(x), r1=10(y), r2=46(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 10
LDI r2, 46
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
