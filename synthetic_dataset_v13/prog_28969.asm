; DESCRIPTION: Composite: Draws a yellow circle centered at (440, 144) with radius 71 then Places a cyan dot at position (329, 252).
; PLAN: r0=440(x), r1=144(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x), r6=252(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 440
LDI r1, 144
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 252
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
