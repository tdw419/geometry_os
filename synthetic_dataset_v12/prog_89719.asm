; DESCRIPTION: Creates a yellow rectangular region at (176, 182) spanning 80 by 47 pixels.
; PLAN: r0=176(x), r1=182(y), r2=80(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 182
LDI r2, 80
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
