; DESCRIPTION: Composite: Draws a orange line from (146, 114) to (52, 99) then Draws a blue circle centered at (393, 164) with radius 11 then Sets a single green pixel at (242, 13).
; PLAN: r0=146(x1), r1=114(y1), r2=52(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=164(y), r7=11(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=242(x), r11=13(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 114
LDI r2, 52
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 164
LDI r7, 11
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 242
LDI r11, 13
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
