; DESCRIPTION: Composite: Draws a green circle centered at (453, 165) with radius 37 then Renders a cyan line between points (91, 215) and (374, 125) then Places a magenta dot at position (195, 132).
; PLAN: r0=453(x), r1=165(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=91(x1), r6=215(y1), r7=374(x2), r8=125(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=195(x), r11=132(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 453
LDI r1, 165
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 91
LDI r6, 215
LDI r7, 374
LDI r8, 125
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 195
LDI r11, 132
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
