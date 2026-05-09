; DESCRIPTION: Composite: Draws a red circle centered at (392, 100) with radius 19 then Places a green dot at position (345, 110).
; PLAN: r0=392(x), r1=100(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=345(x), r6=110(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 392
LDI r1, 100
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 345
LDI r6, 110
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
