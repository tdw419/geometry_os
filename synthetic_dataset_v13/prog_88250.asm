; DESCRIPTION: Composite: Places a green dot at position (314, 70) then Renders a cyan disk with center (147, 160) and radius 24 then Places a green 112x34 rectangle at position (47, 185).
; PLAN: r0=314(x), r1=70(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=147(x), r6=160(y), r7=24(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=47(x), r11=185(y), r12=112(width), r13=34(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 70
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 147
LDI r6, 160
LDI r7, 24
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 47
LDI r11, 185
LDI r12, 112
LDI r13, 34
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
