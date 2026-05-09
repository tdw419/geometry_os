; DESCRIPTION: Creates a yellow rectangular region at (102, 28) spanning 75 by 74 pixels.
; PLAN: r0=102(x), r1=28(y), r2=75(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 28
LDI r2, 75
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
