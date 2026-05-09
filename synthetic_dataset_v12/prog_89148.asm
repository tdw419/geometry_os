; DESCRIPTION: Creates a blue rectangular region at (187, 22) spanning 37 by 60 pixels.
; PLAN: r0=187(x), r1=22(y), r2=37(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 22
LDI r2, 37
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
