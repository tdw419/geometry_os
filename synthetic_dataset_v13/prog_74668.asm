; DESCRIPTION: Composite: Renders a black line between points (434, 112) and (169, 135) then Renders a purple box of size 35x119 starting at (296, 85) then Places a green dot at position (177, 65).
; PLAN: r0=434(x1), r1=112(y1), r2=169(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=85(y), r7=35(width), r8=119(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=177(x), r11=65(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 434
LDI r1, 112
LDI r2, 169
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 85
LDI r7, 35
LDI r8, 119
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 65
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
