; DESCRIPTION: Composite: Places a yellow dot at position (146, 199) then Renders a cyan line between points (499, 164) and (70, 166) then Renders a black disk with center (375, 128) and radius 65.
; PLAN: r0=146(x), r1=199(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=499(x1), r6=164(y1), r7=70(x2), r8=166(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=375(x), r11=128(y), r12=65(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 146
LDI r1, 199
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 499
LDI r6, 164
LDI r7, 70
LDI r8, 166
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 128
LDI r12, 65
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
