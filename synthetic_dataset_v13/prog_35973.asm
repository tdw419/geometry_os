; DESCRIPTION: Composite: Sets a single purple pixel at (319, 253) then Places a black line segment connecting (266, 97) to (228, 239) then Places a orange circle of radius 50 at center (367, 166).
; PLAN: r0=319(x), r1=253(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=266(x1), r6=97(y1), r7=228(x2), r8=239(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=367(x), r11=166(y), r12=50(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 319
LDI r1, 253
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 266
LDI r6, 97
LDI r7, 228
LDI r8, 239
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 166
LDI r12, 50
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
