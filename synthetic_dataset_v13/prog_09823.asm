; DESCRIPTION: Composite: Sets a single cyan pixel at (284, 111) then Draws a black circle centered at (309, 49) with radius 10 then Draws a green line from (309, 144) to (26, 68).
; PLAN: r0=284(x), r1=111(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=49(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=309(x1), r11=144(y1), r12=26(x2), r13=68(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 111
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 309
LDI r6, 49
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 309
LDI r11, 144
LDI r12, 26
LDI r13, 68
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
