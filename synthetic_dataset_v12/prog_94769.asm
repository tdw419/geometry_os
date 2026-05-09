; DESCRIPTION: Composite: Places a yellow dot at position (111, 196) then Places a green circle of radius 55 at center (415, 115) then Places a white line segment connecting (184, 229) to (234, 148).
; PLAN: r0=111(x), r1=196(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=115(y), r7=55(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=184(x1), r11=229(y1), r12=234(x2), r13=148(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 196
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 415
LDI r6, 115
LDI r7, 55
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 184
LDI r11, 229
LDI r12, 234
LDI r13, 148
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
