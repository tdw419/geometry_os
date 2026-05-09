; DESCRIPTION: Creates a yellow rectangular region at (69, 119) spanning 30 by 48 pixels.
; PLAN: r0=69(x), r1=119(y), r2=30(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 119
LDI r2, 30
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
