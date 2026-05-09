; DESCRIPTION: Composite: Renders a red disk with center (319, 172) and radius 78 then Places a cyan dot at position (510, 251) then Draws a red line from (111, 224) to (401, 149).
; PLAN: r0=319(x), r1=172(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=510(x), r6=251(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=111(x1), r11=224(y1), r12=401(x2), r13=149(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 172
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 510
LDI r6, 251
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 111
LDI r11, 224
LDI r12, 401
LDI r13, 149
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
