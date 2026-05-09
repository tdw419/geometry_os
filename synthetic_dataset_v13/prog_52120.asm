; DESCRIPTION: Composite: Places a black line segment connecting (66, 111) to (86, 146) then Sets a single white pixel at (281, 172).
; PLAN: r0=66(x1), r1=111(y1), r2=86(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=172(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 66
LDI r1, 111
LDI r2, 86
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 172
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
