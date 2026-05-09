; DESCRIPTION: Creates a yellow rectangular region at (187, 52) spanning 12 by 30 pixels.
; PLAN: r0=187(x), r1=52(y), r2=12(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 52
LDI r2, 12
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
