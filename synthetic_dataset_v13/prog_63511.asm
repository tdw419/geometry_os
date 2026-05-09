; DESCRIPTION: Creates a green rectangular region at (138, 107) spanning 66 by 92 pixels.
; PLAN: r0=138(x), r1=107(y), r2=66(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 107
LDI r2, 66
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
