; DESCRIPTION: Composite: Renders a cyan disk with center (103, 112) and radius 68 then Draws a purple line from (312, 119) to (279, 215).
; PLAN: r0=103(x), r1=112(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x1), r6=119(y1), r7=279(x2), r8=215(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 112
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 119
LDI r7, 279
LDI r8, 215
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
