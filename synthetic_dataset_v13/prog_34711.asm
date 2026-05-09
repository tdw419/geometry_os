; DESCRIPTION: Composite: Places a cyan line segment connecting (342, 47) to (65, 192) then Renders a green disk with center (346, 181) and radius 72 then Sets a single yellow pixel at (352, 144).
; PLAN: r0=342(x1), r1=47(y1), r2=65(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=181(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=352(x), r11=144(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 342
LDI r1, 47
LDI r2, 65
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 181
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 352
LDI r11, 144
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
