; DESCRIPTION: Composite: Renders a blue line between points (434, 2) and (277, 246) then Places a magenta dot at position (404, 128) then Places a blue circle of radius 49 at center (283, 128).
; PLAN: r0=434(x1), r1=2(y1), r2=277(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=128(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=283(x), r11=128(y), r12=49(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 434
LDI r1, 2
LDI r2, 277
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 128
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 283
LDI r11, 128
LDI r12, 49
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
