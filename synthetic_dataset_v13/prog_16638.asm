; DESCRIPTION: Composite: Places a yellow circle of radius 29 at center (224, 141) then Renders a yellow line between points (469, 229) and (187, 8).
; PLAN: r0=224(x), r1=141(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x1), r6=229(y1), r7=187(x2), r8=8(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 141
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 229
LDI r7, 187
LDI r8, 8
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
