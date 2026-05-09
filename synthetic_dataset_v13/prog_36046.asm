; DESCRIPTION: Composite: Places a yellow line segment connecting (216, 48) to (12, 52) then Places a yellow dot at position (146, 86).
; PLAN: r0=216(x1), r1=48(y1), r2=12(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=86(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 216
LDI r1, 48
LDI r2, 12
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 86
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
