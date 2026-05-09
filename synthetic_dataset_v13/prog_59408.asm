; DESCRIPTION: Composite: Sets a single red pixel at (403, 185) then Places a green line segment connecting (391, 152) to (155, 161) then Creates a cyan circular shape at (433, 88) with radius 48.
; PLAN: r0=403(x), r1=185(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=391(x1), r6=152(y1), r7=155(x2), r8=161(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=433(x), r11=88(y), r12=48(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 403
LDI r1, 185
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 391
LDI r6, 152
LDI r7, 155
LDI r8, 161
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 433
LDI r11, 88
LDI r12, 48
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
