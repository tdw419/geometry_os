; DESCRIPTION: Creates a yellow rectangular region at (93, 186) spanning 51 by 68 pixels.
; PLAN: r0=93(x), r1=186(y), r2=51(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 186
LDI r2, 51
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
