; DESCRIPTION: Composite: Places a yellow dot at position (95, 161) then Places a green line segment connecting (75, 49) to (279, 6).
; PLAN: r0=95(x), r1=161(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=75(x1), r6=49(y1), r7=279(x2), r8=6(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 161
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 75
LDI r6, 49
LDI r7, 279
LDI r8, 6
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
