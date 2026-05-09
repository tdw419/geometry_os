; DESCRIPTION: Creates a yellow rectangular region at (366, 91) spanning 37 by 90 pixels.
; PLAN: r0=366(x), r1=91(y), r2=37(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 91
LDI r2, 37
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
