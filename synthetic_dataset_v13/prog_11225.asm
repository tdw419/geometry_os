; DESCRIPTION: Composite: Renders a cyan disk with center (490, 182) and radius 18 then Places a magenta line segment connecting (454, 164) to (141, 225).
; PLAN: r0=490(x), r1=182(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x1), r6=164(y1), r7=141(x2), r8=225(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 490
LDI r1, 182
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 164
LDI r7, 141
LDI r8, 225
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
