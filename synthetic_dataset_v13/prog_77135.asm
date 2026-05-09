; DESCRIPTION: Composite: Places a green dot at position (152, 78) then Renders a cyan line between points (287, 18) and (308, 52) then Renders a magenta disk with center (300, 159) and radius 46.
; PLAN: r0=152(x), r1=78(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=287(x1), r6=18(y1), r7=308(x2), r8=52(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=300(x), r11=159(y), r12=46(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 152
LDI r1, 78
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 287
LDI r6, 18
LDI r7, 308
LDI r8, 52
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 159
LDI r12, 46
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
