; DESCRIPTION: Composite: Draws a blue line from (401, 201) to (144, 209) then Draws a yellow circle centered at (282, 164) with radius 70 then Places a black dot at position (502, 63).
; PLAN: r0=401(x1), r1=201(y1), r2=144(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=164(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=502(x), r11=63(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 401
LDI r1, 201
LDI r2, 144
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 164
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 502
LDI r11, 63
LDI r12, 0x000000
PSET r10, r11, r12
HALT
