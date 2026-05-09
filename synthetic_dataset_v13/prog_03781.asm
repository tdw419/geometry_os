; DESCRIPTION: Composite: Draws a cyan line from (382, 167) to (321, 225) then Draws a black rectangle at (91, 56) with width 80 and height 115.
; PLAN: r0=382(x1), r1=167(y1), r2=321(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=56(y), r7=80(width), r8=115(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 167
LDI r2, 321
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 56
LDI r7, 80
LDI r8, 115
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
