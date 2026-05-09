; DESCRIPTION: Composite: Renders a cyan line between points (395, 170) and (351, 53) then Creates a white rectangular region at (357, 129) spanning 93 by 64 pixels then Sets a single purple pixel at (299, 1).
; PLAN: r0=395(x1), r1=170(y1), r2=351(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=357(x), r6=129(y), r7=93(width), r8=64(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=299(x), r11=1(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 395
LDI r1, 170
LDI r2, 351
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 129
LDI r7, 93
LDI r8, 64
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 1
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
