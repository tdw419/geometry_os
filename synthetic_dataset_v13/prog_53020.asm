; DESCRIPTION: Composite: Places a green dot at position (342, 253) then Places a yellow circle of radius 32 at center (249, 123) then Places a red line segment connecting (466, 223) to (422, 125).
; PLAN: r0=342(x), r1=253(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=123(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=466(x1), r11=223(y1), r12=422(x2), r13=125(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 253
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 249
LDI r6, 123
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 466
LDI r11, 223
LDI r12, 422
LDI r13, 125
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
