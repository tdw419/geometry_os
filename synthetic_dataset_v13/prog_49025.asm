; DESCRIPTION: Composite: Renders a green line between points (175, 209) and (147, 213) then Places a cyan dot at position (290, 125) then Creates a red rectangular region at (385, 212) spanning 63 by 40 pixels.
; PLAN: r0=175(x1), r1=209(y1), r2=147(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=290(x), r6=125(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=385(x), r11=212(y), r12=63(width), r13=40(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 175
LDI r1, 209
LDI r2, 147
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 125
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 385
LDI r11, 212
LDI r12, 63
LDI r13, 40
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
