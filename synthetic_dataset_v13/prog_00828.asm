; DESCRIPTION: Creates a purple rectangular region at (71, 155) spanning 91 by 45 pixels.
; PLAN: r0=71(x), r1=155(y), r2=91(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 155
LDI r2, 91
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
