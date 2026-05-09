; DESCRIPTION: Creates a yellow rectangular region at (382, 11) spanning 109 by 104 pixels.
; PLAN: r0=382(x), r1=11(y), r2=109(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 11
LDI r2, 109
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
