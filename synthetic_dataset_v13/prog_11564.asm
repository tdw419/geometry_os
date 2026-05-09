; DESCRIPTION: Composite: Renders a cyan disk with center (402, 124) and radius 48 then Places a red line segment connecting (450, 211) to (431, 155).
; PLAN: r0=402(x), r1=124(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x1), r6=211(y1), r7=431(x2), r8=155(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 124
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 211
LDI r7, 431
LDI r8, 155
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
