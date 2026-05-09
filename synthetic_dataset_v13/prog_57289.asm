; DESCRIPTION: Composite: Draws a black circle centered at (372, 103) with radius 32 then Places a yellow line segment connecting (391, 23) to (146, 153) then Sets a single black pixel at (446, 243).
; PLAN: r0=372(x), r1=103(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x1), r6=23(y1), r7=146(x2), r8=153(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=446(x), r11=243(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 372
LDI r1, 103
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 23
LDI r7, 146
LDI r8, 153
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 243
LDI r12, 0x000000
PSET r10, r11, r12
HALT
