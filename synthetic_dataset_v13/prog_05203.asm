; DESCRIPTION: Creates a blue rectangular region at (330, 66) spanning 65 by 18 pixels.
; PLAN: r0=330(x), r1=66(y), r2=65(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 66
LDI r2, 65
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
