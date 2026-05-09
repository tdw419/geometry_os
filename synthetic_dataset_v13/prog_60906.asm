; DESCRIPTION: Composite: Places a yellow line segment connecting (23, 55) to (52, 75) then Places a green dot at position (151, 38).
; PLAN: r0=23(x1), r1=55(y1), r2=52(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=38(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 23
LDI r1, 55
LDI r2, 52
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 38
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
