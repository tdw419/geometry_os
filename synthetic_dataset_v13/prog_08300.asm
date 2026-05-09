; DESCRIPTION: Composite: Places a magenta circle of radius 24 at center (146, 187) then Renders a green line between points (43, 248) and (350, 211) then Places a green dot at position (59, 214).
; PLAN: r0=146(x), r1=187(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=43(x1), r6=248(y1), r7=350(x2), r8=211(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=59(x), r11=214(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 187
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 43
LDI r6, 248
LDI r7, 350
LDI r8, 211
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 214
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
