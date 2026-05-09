; DESCRIPTION: Creates a blue rectangular region at (302, 65) spanning 76 by 30 pixels.
; PLAN: r0=302(x), r1=65(y), r2=76(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 65
LDI r2, 76
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
