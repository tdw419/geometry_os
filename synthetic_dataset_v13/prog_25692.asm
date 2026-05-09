; DESCRIPTION: Composite: Places a black line segment connecting (465, 44) to (345, 165) then Sets a single white pixel at (287, 27).
; PLAN: r0=465(x1), r1=44(y1), r2=345(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=27(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 465
LDI r1, 44
LDI r2, 345
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 27
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
