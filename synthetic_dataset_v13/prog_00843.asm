; DESCRIPTION: Composite: Places a cyan line segment connecting (372, 46) to (365, 207) then Sets a single blue pixel at (66, 16).
; PLAN: r0=372(x1), r1=46(y1), r2=365(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=16(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 372
LDI r1, 46
LDI r2, 365
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 16
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
