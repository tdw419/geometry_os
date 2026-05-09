; DESCRIPTION: Composite: Draws a red circle centered at (405, 56) with radius 17 then Renders a purple line between points (160, 125) and (50, 35) then Places a cyan dot at position (459, 29).
; PLAN: r0=405(x), r1=56(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x1), r6=125(y1), r7=50(x2), r8=35(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=459(x), r11=29(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 405
LDI r1, 56
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 125
LDI r7, 50
LDI r8, 35
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 459
LDI r11, 29
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
