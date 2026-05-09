; DESCRIPTION: Composite: Places a purple dot at position (46, 82) then Places a cyan line segment connecting (219, 66) to (400, 55).
; PLAN: r0=46(x), r1=82(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=219(x1), r6=66(y1), r7=400(x2), r8=55(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 46
LDI r1, 82
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 219
LDI r6, 66
LDI r7, 400
LDI r8, 55
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
