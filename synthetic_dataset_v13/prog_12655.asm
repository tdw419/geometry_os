; DESCRIPTION: Composite: Draws a blue circle centered at (337, 223) with radius 24 then Places a cyan line segment connecting (487, 213) to (156, 132) then Sets a single red pixel at (139, 200).
; PLAN: r0=337(x), r1=223(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x1), r6=213(y1), r7=156(x2), r8=132(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=139(x), r11=200(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 223
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 213
LDI r7, 156
LDI r8, 132
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 200
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
