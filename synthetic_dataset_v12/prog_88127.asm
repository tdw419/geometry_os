; DESCRIPTION: Creates a yellow rectangular region at (32, 161) spanning 14 by 87 pixels.
; PLAN: r0=32(x), r1=161(y), r2=14(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 161
LDI r2, 14
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
