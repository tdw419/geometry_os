; DESCRIPTION: Composite: Places a green dot at position (301, 43) then Places a cyan line segment connecting (225, 213) to (273, 202).
; PLAN: r0=301(x), r1=43(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=225(x1), r6=213(y1), r7=273(x2), r8=202(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 43
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 225
LDI r6, 213
LDI r7, 273
LDI r8, 202
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
