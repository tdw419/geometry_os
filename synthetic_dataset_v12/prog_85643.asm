; DESCRIPTION: Composite: Draws a cyan circle centered at (168, 120) with radius 13 then Sets a single red pixel at (127, 125) then Draws a blue line from (206, 157) to (97, 189).
; PLAN: r0=168(x), r1=120(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x), r6=125(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=206(x1), r11=157(y1), r12=97(x2), r13=189(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 120
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 125
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 206
LDI r11, 157
LDI r12, 97
LDI r13, 189
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
