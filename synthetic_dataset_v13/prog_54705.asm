; DESCRIPTION: Composite: Places a black dot at position (160, 32) then Places a cyan line segment connecting (225, 151) to (280, 233).
; PLAN: r0=160(x), r1=32(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=225(x1), r6=151(y1), r7=280(x2), r8=233(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 32
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 225
LDI r6, 151
LDI r7, 280
LDI r8, 233
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
