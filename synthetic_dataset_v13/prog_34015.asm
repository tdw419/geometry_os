; DESCRIPTION: Creates a yellow rectangular region at (260, 91) spanning 30 by 92 pixels.
; PLAN: r0=260(x), r1=91(y), r2=30(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 91
LDI r2, 30
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
