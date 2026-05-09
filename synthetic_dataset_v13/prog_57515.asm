; DESCRIPTION: Creates a blue rectangular region at (331, 177) spanning 54 by 65 pixels.
; PLAN: r0=331(x), r1=177(y), r2=54(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 177
LDI r2, 54
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
