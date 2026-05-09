; DESCRIPTION: Composite: Places a red dot at position (100, 164) then Places a green line segment connecting (55, 161) to (508, 209).
; PLAN: r0=100(x), r1=164(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=55(x1), r6=161(y1), r7=508(x2), r8=209(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 164
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 55
LDI r6, 161
LDI r7, 508
LDI r8, 209
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
