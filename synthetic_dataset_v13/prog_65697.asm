; DESCRIPTION: Composite: Sets a single cyan pixel at (506, 135) then Renders a black disk with center (275, 129) and radius 35 then Renders a purple line between points (73, 62) and (362, 30).
; PLAN: r0=506(x), r1=135(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=275(x), r6=129(y), r7=35(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=73(x1), r11=62(y1), r12=362(x2), r13=30(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 506
LDI r1, 135
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 275
LDI r6, 129
LDI r7, 35
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 73
LDI r11, 62
LDI r12, 362
LDI r13, 30
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
