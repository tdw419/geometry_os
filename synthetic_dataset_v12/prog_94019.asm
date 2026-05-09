; DESCRIPTION: Creates a blue rectangular region at (300, 188) spanning 91 by 65 pixels.
; PLAN: r0=300(x), r1=188(y), r2=91(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 188
LDI r2, 91
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
