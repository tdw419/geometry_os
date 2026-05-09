; DESCRIPTION: Composite: Creates a yellow circular shape at (386, 81) with radius 64 then Sets a single orange pixel at (284, 5) then Renders a white line between points (297, 84) and (321, 10).
; PLAN: r0=386(x), r1=81(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=5(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=297(x1), r11=84(y1), r12=321(x2), r13=10(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 81
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 5
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 297
LDI r11, 84
LDI r12, 321
LDI r13, 10
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
