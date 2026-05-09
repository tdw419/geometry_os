; DESCRIPTION: Composite: Sets a single cyan pixel at (479, 43) then Places a purple line segment connecting (248, 24) to (437, 190).
; PLAN: r0=479(x), r1=43(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=248(x1), r6=24(y1), r7=437(x2), r8=190(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 479
LDI r1, 43
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 248
LDI r6, 24
LDI r7, 437
LDI r8, 190
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
