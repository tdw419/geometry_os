; DESCRIPTION: Creates a red rectangular region at (94, 137) spanning 22 by 107 pixels.
; PLAN: r0=94(x), r1=137(y), r2=22(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 137
LDI r2, 22
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
