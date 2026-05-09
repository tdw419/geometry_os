; DESCRIPTION: Composite: Places a cyan line segment connecting (418, 132) to (325, 36) then Renders a cyan disk with center (290, 104) and radius 63.
; PLAN: r0=418(x1), r1=132(y1), r2=325(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=290(x), r6=104(y), r7=63(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 418
LDI r1, 132
LDI r2, 325
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 104
LDI r7, 63
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
