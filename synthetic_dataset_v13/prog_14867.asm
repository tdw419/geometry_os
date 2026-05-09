; DESCRIPTION: Composite: Creates a green rectangular region at (237, 70) spanning 59 by 104 pixels then Sets a single white pixel at (190, 54).
; PLAN: r0=237(x), r1=70(y), r2=59(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=54(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 237
LDI r1, 70
LDI r2, 59
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 54
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
