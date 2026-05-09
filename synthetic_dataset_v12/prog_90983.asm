; DESCRIPTION: Composite: Places a blue line segment connecting (382, 238) to (458, 199) then Creates a yellow rectangular region at (116, 83) spanning 90 by 16 pixels.
; PLAN: r0=382(x1), r1=238(y1), r2=458(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=83(y), r7=90(width), r8=16(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 238
LDI r2, 458
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 83
LDI r7, 90
LDI r8, 16
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
