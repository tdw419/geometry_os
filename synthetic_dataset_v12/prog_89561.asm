; DESCRIPTION: Composite: Renders a cyan disk with center (103, 80) and radius 30 then Renders a purple line between points (264, 91) and (60, 55).
; PLAN: r0=103(x), r1=80(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=264(x1), r6=91(y1), r7=60(x2), r8=55(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 80
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 264
LDI r6, 91
LDI r7, 60
LDI r8, 55
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
