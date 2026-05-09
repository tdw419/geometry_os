; DESCRIPTION: Composite: Places a blue line segment connecting (458, 3) to (173, 141) then Renders a blue box of size 103x83 starting at (147, 17) then Places a yellow dot at position (404, 252).
; PLAN: r0=458(x1), r1=3(y1), r2=173(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=147(x), r6=17(y), r7=103(width), r8=83(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=404(x), r11=252(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 458
LDI r1, 3
LDI r2, 173
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 17
LDI r7, 103
LDI r8, 83
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 252
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
