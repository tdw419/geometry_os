; DESCRIPTION: Composite: Sets a single green pixel at (509, 114) then Places a magenta line segment connecting (321, 138) to (431, 81).
; PLAN: r0=509(x), r1=114(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=321(x1), r6=138(y1), r7=431(x2), r8=81(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 509
LDI r1, 114
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 321
LDI r6, 138
LDI r7, 431
LDI r8, 81
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
