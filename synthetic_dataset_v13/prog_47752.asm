; DESCRIPTION: Creates a yellow rectangular region at (45, 30) spanning 16 by 76 pixels.
; PLAN: r0=45(x), r1=30(y), r2=16(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 30
LDI r2, 16
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
