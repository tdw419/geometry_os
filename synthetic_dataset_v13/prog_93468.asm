; DESCRIPTION: Composite: Places a cyan dot at position (331, 220) then Places a purple line segment connecting (230, 252) to (227, 187).
; PLAN: r0=331(x), r1=220(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=230(x1), r6=252(y1), r7=227(x2), r8=187(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 331
LDI r1, 220
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 252
LDI r7, 227
LDI r8, 187
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
