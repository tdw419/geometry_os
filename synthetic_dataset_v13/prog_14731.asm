; DESCRIPTION: Composite: Places a white line segment connecting (452, 233) to (302, 32) then Sets a single cyan pixel at (46, 89).
; PLAN: r0=452(x1), r1=233(y1), r2=302(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=46(x), r6=89(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 452
LDI r1, 233
LDI r2, 302
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 89
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
