; DESCRIPTION: Creates a green rectangular region at (46, 18) spanning 102 by 64 pixels.
; PLAN: r0=46(x), r1=18(y), r2=102(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 18
LDI r2, 102
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
