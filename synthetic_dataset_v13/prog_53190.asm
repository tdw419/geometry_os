; DESCRIPTION: Creates a yellow rectangular region at (107, 54) spanning 14 by 92 pixels.
; PLAN: r0=107(x), r1=54(y), r2=14(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 54
LDI r2, 14
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
