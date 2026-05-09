; DESCRIPTION: Composite: Places a cyan dot at position (461, 19) then Places a magenta line segment connecting (434, 71) to (260, 47).
; PLAN: r0=461(x), r1=19(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=434(x1), r6=71(y1), r7=260(x2), r8=47(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 19
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 434
LDI r6, 71
LDI r7, 260
LDI r8, 47
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
