; DESCRIPTION: Composite: Places a white dot at position (200, 80) then Renders a magenta disk with center (443, 182) and radius 23 then Places a blue line segment connecting (283, 143) to (434, 84).
; PLAN: r0=200(x), r1=80(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=443(x), r6=182(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=283(x1), r11=143(y1), r12=434(x2), r13=84(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 200
LDI r1, 80
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 443
LDI r6, 182
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 283
LDI r11, 143
LDI r12, 434
LDI r13, 84
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
