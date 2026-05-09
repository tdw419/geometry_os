; DESCRIPTION: Composite: Draws a yellow circle centered at (294, 206) with radius 32 then Draws a white line from (391, 2) to (354, 211) then Places a purple dot at position (330, 6).
; PLAN: r0=294(x), r1=206(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x1), r6=2(y1), r7=354(x2), r8=211(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=330(x), r11=6(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 294
LDI r1, 206
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 2
LDI r7, 354
LDI r8, 211
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 6
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
