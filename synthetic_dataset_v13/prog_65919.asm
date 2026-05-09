; DESCRIPTION: Composite: Draws a cyan circle centered at (301, 54) with radius 42 then Places a yellow dot at position (426, 37) then Renders a green line between points (391, 239) and (144, 199).
; PLAN: r0=301(x), r1=54(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x), r6=37(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=391(x1), r11=239(y1), r12=144(x2), r13=199(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 54
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 37
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 391
LDI r11, 239
LDI r12, 144
LDI r13, 199
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
