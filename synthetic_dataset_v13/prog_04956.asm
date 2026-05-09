; DESCRIPTION: Composite: Places a green circle of radius 18 at center (425, 237) then Places a cyan line segment connecting (483, 112) to (146, 27).
; PLAN: r0=425(x), r1=237(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x1), r6=112(y1), r7=146(x2), r8=27(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 237
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 112
LDI r7, 146
LDI r8, 27
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
