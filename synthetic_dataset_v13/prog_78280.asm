; DESCRIPTION: Composite: Draws a cyan circle centered at (240, 149) with radius 73 then Draws a purple line from (77, 98) to (373, 73).
; PLAN: r0=240(x), r1=149(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x1), r6=98(y1), r7=373(x2), r8=73(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 149
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 98
LDI r7, 373
LDI r8, 73
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
