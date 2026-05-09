; DESCRIPTION: Creates a green rectangular region at (102, 141) spanning 87 by 66 pixels.
; PLAN: r0=102(x), r1=141(y), r2=87(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 141
LDI r2, 87
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
