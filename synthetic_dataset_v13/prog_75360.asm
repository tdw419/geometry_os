; DESCRIPTION: Creates a yellow rectangular region at (411, 166) spanning 83 by 14 pixels.
; PLAN: r0=411(x), r1=166(y), r2=83(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 166
LDI r2, 83
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
