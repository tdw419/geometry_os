; DESCRIPTION: Composite: Draws a orange circle centered at (182, 127) with radius 68 then Places a green dot at position (162, 225).
; PLAN: r0=182(x), r1=127(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=225(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 182
LDI r1, 127
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 225
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
