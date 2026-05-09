; DESCRIPTION: Composite: Renders a cyan line between points (104, 111) and (32, 63) then Places a orange dot at position (298, 127) then Draws a red circle centered at (326, 84) with radius 24.
; PLAN: r0=104(x1), r1=111(y1), r2=32(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=127(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=326(x), r11=84(y), r12=24(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 104
LDI r1, 111
LDI r2, 32
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 127
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 326
LDI r11, 84
LDI r12, 24
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
