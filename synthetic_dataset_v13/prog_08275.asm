; DESCRIPTION: Creates a yellow rectangular region at (177, 163) spanning 90 by 29 pixels.
; PLAN: r0=177(x), r1=163(y), r2=90(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 163
LDI r2, 90
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
