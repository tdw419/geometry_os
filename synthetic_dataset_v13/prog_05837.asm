; DESCRIPTION: Composite: Sets a single purple pixel at (171, 99) then Draws a purple circle centered at (402, 84) with radius 29 then Draws a white line from (284, 34) to (221, 82).
; PLAN: r0=171(x), r1=99(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=402(x), r6=84(y), r7=29(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x1), r11=34(y1), r12=221(x2), r13=82(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 99
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 402
LDI r6, 84
LDI r7, 29
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 34
LDI r12, 221
LDI r13, 82
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
