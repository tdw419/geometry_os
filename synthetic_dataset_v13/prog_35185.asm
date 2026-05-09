; DESCRIPTION: Composite: Places a cyan dot at position (217, 190) then Renders a yellow disk with center (187, 99) and radius 36 then Places a white line segment connecting (18, 124) to (422, 248).
; PLAN: r0=217(x), r1=190(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=99(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=18(x1), r11=124(y1), r12=422(x2), r13=248(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 190
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 187
LDI r6, 99
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 18
LDI r11, 124
LDI r12, 422
LDI r13, 248
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
