; DESCRIPTION: Composite: Places a red circle of radius 25 at center (206, 113) then Renders a purple line between points (465, 45) and (178, 154).
; PLAN: r0=206(x), r1=113(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x1), r6=45(y1), r7=178(x2), r8=154(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 113
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 45
LDI r7, 178
LDI r8, 154
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
