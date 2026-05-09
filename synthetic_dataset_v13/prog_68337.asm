; DESCRIPTION: Creates a red rectangular region at (58, 225) spanning 22 by 25 pixels.
; PLAN: r0=58(x), r1=225(y), r2=22(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 225
LDI r2, 22
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
