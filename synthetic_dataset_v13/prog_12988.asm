; DESCRIPTION: Composite: Creates a blue circular shape at (137, 167) with radius 71 then Draws a cyan line from (317, 67) to (453, 54).
; PLAN: r0=137(x), r1=167(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x1), r6=67(y1), r7=453(x2), r8=54(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 167
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 67
LDI r7, 453
LDI r8, 54
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
