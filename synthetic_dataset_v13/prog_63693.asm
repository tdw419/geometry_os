; DESCRIPTION: Composite: Draws a blue line from (12, 187) to (273, 34) then Renders a orange disk with center (261, 86) and radius 40 then Places a green dot at position (28, 32).
; PLAN: r0=12(x1), r1=187(y1), r2=273(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=86(y), r7=40(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=28(x), r11=32(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 12
LDI r1, 187
LDI r2, 273
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 86
LDI r7, 40
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 28
LDI r11, 32
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
