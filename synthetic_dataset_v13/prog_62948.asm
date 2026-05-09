; DESCRIPTION: Composite: Renders a purple disk with center (480, 150) and radius 30 then Draws a red line from (364, 209) to (136, 170).
; PLAN: r0=480(x), r1=150(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=364(x1), r6=209(y1), r7=136(x2), r8=170(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 480
LDI r1, 150
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 364
LDI r6, 209
LDI r7, 136
LDI r8, 170
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
