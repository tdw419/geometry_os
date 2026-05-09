; DESCRIPTION: Creates a yellow rectangular region at (117, 30) spanning 71 by 87 pixels.
; PLAN: r0=117(x), r1=30(y), r2=71(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 30
LDI r2, 71
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
