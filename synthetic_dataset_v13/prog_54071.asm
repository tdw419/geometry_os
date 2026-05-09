; DESCRIPTION: Creates a yellow rectangular region at (37, 154) spanning 110 by 87 pixels.
; PLAN: r0=37(x), r1=154(y), r2=110(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 154
LDI r2, 110
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
