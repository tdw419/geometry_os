; DESCRIPTION: Composite: Renders a red line between points (439, 64) and (353, 152) then Draws a cyan circle centered at (320, 183) with radius 43 then Places a green dot at position (212, 192).
; PLAN: r0=439(x1), r1=64(y1), r2=353(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=183(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=212(x), r11=192(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 439
LDI r1, 64
LDI r2, 353
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 183
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 212
LDI r11, 192
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
