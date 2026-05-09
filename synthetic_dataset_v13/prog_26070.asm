; DESCRIPTION: Composite: Sets a single green pixel at (311, 231) then Renders a blue disk with center (380, 58) and radius 38 then Draws a blue line from (245, 129) to (364, 0).
; PLAN: r0=311(x), r1=231(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=380(x), r6=58(y), r7=38(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=245(x1), r11=129(y1), r12=364(x2), r13=0(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 231
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 380
LDI r6, 58
LDI r7, 38
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 245
LDI r11, 129
LDI r12, 364
LDI r13, 0
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
