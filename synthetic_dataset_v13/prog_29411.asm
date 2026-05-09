; DESCRIPTION: Composite: Places a green dot at position (490, 161) then Places a cyan line segment connecting (405, 172) to (57, 223).
; PLAN: r0=490(x), r1=161(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=405(x1), r6=172(y1), r7=57(x2), r8=223(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 490
LDI r1, 161
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 405
LDI r6, 172
LDI r7, 57
LDI r8, 223
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
