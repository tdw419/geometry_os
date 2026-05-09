; DESCRIPTION: Composite: Places a purple dot at position (151, 10) then Places a black line segment connecting (130, 86) to (327, 38).
; PLAN: r0=151(x), r1=10(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=130(x1), r6=86(y1), r7=327(x2), r8=38(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 10
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 130
LDI r6, 86
LDI r7, 327
LDI r8, 38
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
