; DESCRIPTION: Composite: Draws a cyan line from (36, 211) to (106, 66) then Draws a white circle centered at (367, 85) with radius 71.
; PLAN: r0=36(x1), r1=211(y1), r2=106(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=85(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 36
LDI r1, 211
LDI r2, 106
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 85
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
