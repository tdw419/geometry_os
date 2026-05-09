; DESCRIPTION: Composite: Draws a yellow line from (182, 177) to (53, 169) then Renders a black box of size 107x24 starting at (276, 95) then Sets a single green pixel at (320, 14).
; PLAN: r0=182(x1), r1=177(y1), r2=53(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=95(y), r7=107(width), r8=24(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=320(x), r11=14(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 182
LDI r1, 177
LDI r2, 53
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 95
LDI r7, 107
LDI r8, 24
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 14
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
