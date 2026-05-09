; DESCRIPTION: Creates a black rectangular region at (190, 22) spanning 56 by 91 pixels.
; PLAN: r0=190(x), r1=22(y), r2=56(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 22
LDI r2, 56
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
