; DESCRIPTION: Composite: Places a yellow dot at position (321, 239) then Renders a blue disk with center (421, 95) and radius 21 then Renders a cyan line between points (373, 121) and (21, 17).
; PLAN: r0=321(x), r1=239(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=421(x), r6=95(y), r7=21(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=373(x1), r11=121(y1), r12=21(x2), r13=17(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 239
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 421
LDI r6, 95
LDI r7, 21
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 373
LDI r11, 121
LDI r12, 21
LDI r13, 17
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
