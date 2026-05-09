; DESCRIPTION: Creates a blue rectangular region at (248, 182) spanning 39 by 10 pixels.
; PLAN: r0=248(x), r1=182(y), r2=39(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 182
LDI r2, 39
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
