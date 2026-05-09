; DESCRIPTION: Composite: Draws a red circle centered at (133, 136) with radius 49 then Draws a magenta line from (223, 5) to (292, 230) then Sets a single cyan pixel at (255, 253).
; PLAN: r0=133(x), r1=136(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x1), r6=5(y1), r7=292(x2), r8=230(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=255(x), r11=253(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 133
LDI r1, 136
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 5
LDI r7, 292
LDI r8, 230
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 253
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
