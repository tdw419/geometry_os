; DESCRIPTION: Composite: Places a blue dot at position (132, 225) then Places a cyan line segment connecting (60, 18) to (273, 242).
; PLAN: r0=132(x), r1=225(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=60(x1), r6=18(y1), r7=273(x2), r8=242(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 132
LDI r1, 225
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 60
LDI r6, 18
LDI r7, 273
LDI r8, 242
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
