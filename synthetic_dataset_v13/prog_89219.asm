; DESCRIPTION: Creates a yellow rectangular region at (207, 28) spanning 48 by 15 pixels.
; PLAN: r0=207(x), r1=28(y), r2=48(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 28
LDI r2, 48
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
