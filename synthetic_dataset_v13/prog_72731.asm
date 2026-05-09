; DESCRIPTION: Composite: Renders a green line between points (168, 4) and (431, 45) then Draws a cyan circle centered at (266, 86) with radius 47 then Places a purple dot at position (320, 222).
; PLAN: r0=168(x1), r1=4(y1), r2=431(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=86(y), r7=47(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=320(x), r11=222(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 168
LDI r1, 4
LDI r2, 431
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 86
LDI r7, 47
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 320
LDI r11, 222
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
