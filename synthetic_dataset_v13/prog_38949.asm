; DESCRIPTION: Creates a green rectangular region at (170, 31) spanning 49 by 32 pixels.
; PLAN: r0=170(x), r1=31(y), r2=49(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 31
LDI r2, 49
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
