; DESCRIPTION: Composite: Places a cyan line segment connecting (332, 245) to (0, 48) then Places a purple dot at position (146, 92).
; PLAN: r0=332(x1), r1=245(y1), r2=0(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=92(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 245
LDI r2, 0
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 92
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
