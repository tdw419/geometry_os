; DESCRIPTION: Composite: Renders a green line between points (494, 111) and (147, 99) then Places a magenta 50x54 rectangle at position (138, 156) then Places a red dot at position (229, 91).
; PLAN: r0=494(x1), r1=111(y1), r2=147(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=156(y), r7=50(width), r8=54(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=229(x), r11=91(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 494
LDI r1, 111
LDI r2, 147
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 156
LDI r7, 50
LDI r8, 54
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 91
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
