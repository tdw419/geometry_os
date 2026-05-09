; DESCRIPTION: Composite: Renders a cyan line between points (479, 251) and (405, 7) then Draws a red rectangle at (98, 179) with width 106 and height 68 then Renders a yellow disk with center (245, 147) and radius 20.
; PLAN: r0=479(x1), r1=251(y1), r2=405(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=179(y), r7=106(width), r8=68(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=245(x), r11=147(y), r12=20(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 479
LDI r1, 251
LDI r2, 405
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 179
LDI r7, 106
LDI r8, 68
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 147
LDI r12, 20
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
