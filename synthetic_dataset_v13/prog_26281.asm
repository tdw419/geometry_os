; DESCRIPTION: Composite: Places a black circle of radius 45 at center (114, 190) then Renders a magenta line between points (352, 4) and (186, 225).
; PLAN: r0=114(x), r1=190(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x1), r6=4(y1), r7=186(x2), r8=225(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 190
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 4
LDI r7, 186
LDI r8, 225
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
