; DESCRIPTION: Composite: Places a red circle of radius 33 at center (306, 185) then Places a green line segment connecting (7, 162) to (198, 226).
; PLAN: r0=306(x), r1=185(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x1), r6=162(y1), r7=198(x2), r8=226(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 185
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 162
LDI r7, 198
LDI r8, 226
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
