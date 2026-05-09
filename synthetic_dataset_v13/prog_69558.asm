; DESCRIPTION: Creates a yellow rectangular region at (13, 89) spanning 39 by 45 pixels.
; PLAN: r0=13(x), r1=89(y), r2=39(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 89
LDI r2, 39
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
