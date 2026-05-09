; DESCRIPTION: Composite: Places a purple dot at position (273, 50) then Places a cyan line segment connecting (290, 80) to (182, 100) then Renders a blue disk with center (456, 74) and radius 26.
; PLAN: r0=273(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=290(x1), r6=80(y1), r7=182(x2), r8=100(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=456(x), r11=74(y), r12=26(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 273
LDI r1, 50
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 290
LDI r6, 80
LDI r7, 182
LDI r8, 100
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 74
LDI r12, 26
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
