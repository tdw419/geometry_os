; DESCRIPTION: Composite: Sets a single cyan pixel at (235, 16) then Renders a orange disk with center (55, 174) and radius 46 then Renders a yellow line between points (121, 64) and (272, 104).
; PLAN: r0=235(x), r1=16(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=55(x), r6=174(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=121(x1), r11=64(y1), r12=272(x2), r13=104(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 16
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 55
LDI r6, 174
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 121
LDI r11, 64
LDI r12, 272
LDI r13, 104
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
