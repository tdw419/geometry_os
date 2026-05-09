; DESCRIPTION: Composite: Draws a orange circle centered at (196, 103) with radius 80 then Draws a green line from (326, 98) to (220, 150) then Places a orange dot at position (265, 23).
; PLAN: r0=196(x), r1=103(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x1), r6=98(y1), r7=220(x2), r8=150(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=23(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 196
LDI r1, 103
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 98
LDI r7, 220
LDI r8, 150
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 23
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
