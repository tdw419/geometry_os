; DESCRIPTION: Composite: Places a red circle of radius 35 at center (386, 52) then Places a magenta line segment connecting (303, 79) to (248, 231).
; PLAN: r0=386(x), r1=52(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=303(x1), r6=79(y1), r7=248(x2), r8=231(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 52
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 303
LDI r6, 79
LDI r7, 248
LDI r8, 231
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
