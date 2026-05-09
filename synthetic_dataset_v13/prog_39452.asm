; DESCRIPTION: Composite: Draws a green circle centered at (441, 139) with radius 44 then Sets a single cyan pixel at (284, 143) then Places a cyan line segment connecting (9, 207) to (124, 225).
; PLAN: r0=441(x), r1=139(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=143(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=9(x1), r11=207(y1), r12=124(x2), r13=225(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 139
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 143
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 9
LDI r11, 207
LDI r12, 124
LDI r13, 225
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
