; DESCRIPTION: Creates a yellow rectangular region at (158, 146) spanning 77 by 31 pixels.
; PLAN: r0=158(x), r1=146(y), r2=77(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 146
LDI r2, 77
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
