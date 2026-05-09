; DESCRIPTION: Composite: Places a white dot at position (110, 230) then Renders a red line between points (236, 80) and (74, 249) then Renders a magenta disk with center (126, 34) and radius 24.
; PLAN: r0=110(x), r1=230(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=236(x1), r6=80(y1), r7=74(x2), r8=249(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=126(x), r11=34(y), r12=24(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 110
LDI r1, 230
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 236
LDI r6, 80
LDI r7, 74
LDI r8, 249
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 34
LDI r12, 24
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
