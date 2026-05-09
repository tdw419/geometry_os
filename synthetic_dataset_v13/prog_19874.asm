; DESCRIPTION: Composite: Draws a magenta line from (409, 196) to (390, 84) then Places a white circle of radius 66 at center (184, 82) then Places a cyan dot at position (198, 15).
; PLAN: r0=409(x1), r1=196(y1), r2=390(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=82(y), r7=66(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=198(x), r11=15(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 409
LDI r1, 196
LDI r2, 390
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 82
LDI r7, 66
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 198
LDI r11, 15
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
