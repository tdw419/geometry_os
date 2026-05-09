; DESCRIPTION: Composite: Sets a single white pixel at (100, 251) then Renders a cyan line between points (144, 21) and (321, 18) then Creates a white rectangular region at (97, 56) spanning 25 by 86 pixels.
; PLAN: r0=100(x), r1=251(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=144(x1), r6=21(y1), r7=321(x2), r8=18(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=97(x), r11=56(y), r12=25(width), r13=86(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 251
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 144
LDI r6, 21
LDI r7, 321
LDI r8, 18
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 56
LDI r12, 25
LDI r13, 86
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
