; DESCRIPTION: Composite: Places a orange dot at position (281, 197) then Places a purple line segment connecting (488, 142) to (77, 211).
; PLAN: r0=281(x), r1=197(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=488(x1), r6=142(y1), r7=77(x2), r8=211(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 197
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 488
LDI r6, 142
LDI r7, 77
LDI r8, 211
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
