; DESCRIPTION: Creates a white rectangular region at (13, 107) spanning 48 by 118 pixels.
; PLAN: r0=13(x), r1=107(y), r2=48(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 107
LDI r2, 48
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
