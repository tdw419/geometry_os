; DESCRIPTION: Composite: Draws a magenta circle centered at (375, 165) with radius 58 then Renders a black line between points (279, 231) and (460, 111) then Places a cyan dot at position (325, 25).
; PLAN: r0=375(x), r1=165(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x1), r6=231(y1), r7=460(x2), r8=111(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=325(x), r11=25(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 375
LDI r1, 165
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 231
LDI r7, 460
LDI r8, 111
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 25
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
