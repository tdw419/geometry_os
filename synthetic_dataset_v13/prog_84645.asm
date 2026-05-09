; DESCRIPTION: Creates a yellow rectangular region at (45, 176) spanning 90 by 58 pixels.
; PLAN: r0=45(x), r1=176(y), r2=90(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 176
LDI r2, 90
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
