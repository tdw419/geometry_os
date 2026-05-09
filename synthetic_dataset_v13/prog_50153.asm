; DESCRIPTION: Composite: Draws a yellow circle centered at (277, 181) with radius 50 then Draws a green line from (197, 42) to (126, 229) then Places a black dot at position (384, 200).
; PLAN: r0=277(x), r1=181(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x1), r6=42(y1), r7=126(x2), r8=229(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=384(x), r11=200(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 277
LDI r1, 181
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 42
LDI r7, 126
LDI r8, 229
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 384
LDI r11, 200
LDI r12, 0x000000
PSET r10, r11, r12
HALT
