; DESCRIPTION: Composite: Places a cyan dot at position (469, 122) then Places a black line segment connecting (57, 41) to (423, 86).
; PLAN: r0=469(x), r1=122(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=57(x1), r6=41(y1), r7=423(x2), r8=86(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 469
LDI r1, 122
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 57
LDI r6, 41
LDI r7, 423
LDI r8, 86
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
