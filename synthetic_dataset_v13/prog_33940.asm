; DESCRIPTION: Creates a blue rectangular region at (258, 187) spanning 25 by 65 pixels.
; PLAN: r0=258(x), r1=187(y), r2=25(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 187
LDI r2, 25
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
