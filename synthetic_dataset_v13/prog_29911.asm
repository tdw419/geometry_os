; DESCRIPTION: Creates a yellow rectangular region at (280, 45) spanning 11 by 16 pixels.
; PLAN: r0=280(x), r1=45(y), r2=11(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 45
LDI r2, 11
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
