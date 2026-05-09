; DESCRIPTION: Composite: Sets a single white pixel at (229, 21) then Places a cyan line segment connecting (87, 128) to (364, 54).
; PLAN: r0=229(x), r1=21(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=87(x1), r6=128(y1), r7=364(x2), r8=54(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 21
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 87
LDI r6, 128
LDI r7, 364
LDI r8, 54
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
