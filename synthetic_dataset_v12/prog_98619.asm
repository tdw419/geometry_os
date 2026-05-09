; DESCRIPTION: Composite: Draws a cyan circle centered at (140, 40) with radius 18 then Draws a purple line from (328, 87) to (20, 162).
; PLAN: r0=140(x), r1=40(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=328(x1), r6=87(y1), r7=20(x2), r8=162(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 140
LDI r1, 40
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 328
LDI r6, 87
LDI r7, 20
LDI r8, 162
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
