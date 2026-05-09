; DESCRIPTION: Creates a yellow rectangular region at (364, 72) spanning 95 by 65 pixels.
; PLAN: r0=364(x), r1=72(y), r2=95(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 72
LDI r2, 95
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
