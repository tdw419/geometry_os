; DESCRIPTION: Composite: Places a purple dot at position (89, 154) then Places a cyan line segment connecting (171, 16) to (440, 166).
; PLAN: r0=89(x), r1=154(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=171(x1), r6=16(y1), r7=440(x2), r8=166(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 154
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 171
LDI r6, 16
LDI r7, 440
LDI r8, 166
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
